import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:permission_handler/permission_handler.dart';
import 'package:record/record.dart';
import '../../services/whisper_service.dart';
import '../../utils/file_handler.dart';

class VoiceCommandBar extends StatefulWidget {
  final bool isDark;
  final Function(String) onCommand;

  const VoiceCommandBar({
    super.key,
    this.isDark = false,
    required this.onCommand,
  });

  @override
  State<VoiceCommandBar> createState() => _VoiceCommandBarState();
}

class _VoiceCommandBarState extends State<VoiceCommandBar> {
  final AudioRecorder _audioRecorder = AudioRecorder();
  final WhisperService _whisperService = WhisperService();

  bool _isRecording = false;
  bool _isProcessing = false;
  String _statusText = "Say \"Show scheduled...\"";

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    await Permission.microphone.request();
  }

  Future<void> _startRecording() async {
    try {
      if (await _audioRecorder.hasPermission()) {
        String filePath = 'dummy_path_for_web';

        if (!kIsWeb) {
          final directory = await getTemporaryDirectory();
          filePath = '${directory.path}/command_audio.m4a';
        }

        await _audioRecorder.start(
          const RecordConfig(encoder: AudioEncoder.aacLc),
          path: filePath,
        );

        setState(() {
          _isRecording = true;
          _statusText = "Listening...";
        });
      }
    } catch (e) {
      print("Error starting recording: $e");
    }
  }

  Future<void> _stopRecording() async {
    try {
      final path = await _audioRecorder.stop();

      setState(() {
        _isRecording = false;
        _isProcessing = true;
        _statusText = "Processing...";
      });

      if (path != null) {
        // Read bytes using our helper which handles Web (Blob URL) and Native (File Path)
        final bytes = await FileHandler.readFile(path);

        if (bytes != null) {
          final filename = kIsWeb ? 'recording.webm' : 'recording.m4a';
          final text = await _whisperService.transcribeAudio(bytes, filename);

          if (text != null && text.isNotEmpty) {
            widget.onCommand(text);
            setState(() {
              _statusText = "Command: $text";
            });
          } else {
            setState(() {
              _statusText = "Could not hear you";
            });
          }
        } else {
          setState(() {
            _statusText = "Error reading audio";
          });
        }
      }
    } catch (e) {
      print("Error checking recording: $e");
      setState(() {
        _statusText = "Error recording";
      });
    } finally {
      setState(() {
        _isProcessing = false;
        // Reset text after delay
        Future.delayed(const Duration(seconds: 2), () {
          if (mounted && !_isRecording && !_isProcessing) {
            setState(() {
              _statusText = widget.isDark
                  ? 'Say "Open /Accept"'
                  : 'Say "Show scheduled..."';
            });
          }
        });
      });
    }
  }

  @override
  void dispose() {
    _audioRecorder.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Helper colors based on state
    final Color buttonColor = _isRecording
        ? Colors.white
        : (widget.isDark ? const Color(0xFF137FEC) : Colors.blueAccent);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: widget.isDark
            ? const Color(0xFF1E293B).withOpacity(0.9)
            : Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(37),
        border: Border.all(
          color: widget.isDark ? Colors.white10 : Colors.white.withOpacity(0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(widget.isDark ? 0.3 : 0.05),
            blurRadius: widget.isDark ? 32 : 20,
            offset: Offset(0, widget.isDark ? 8 : 10),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onLongPressStart: (_) => _startRecording(),
            onLongPressEnd: (_) => _stopRecording(),
            // Also support tap to toggle for desktop testing if long press is hard
            onTap: () {
              if (_isRecording) {
                _stopRecording();
              } else {
                _startRecording();
              }
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: buttonColor,
                shape: BoxShape.circle,
                boxShadow: widget.isDark && !_isRecording
                    ? [
                        const BoxShadow(
                          color: Color.fromRGBO(19, 127, 236, 0.5),
                          blurRadius: 15,
                        ),
                      ]
                    : [],
              ),
              child: _isProcessing
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: widget.isDark ? Colors.white : Colors.blue,
                      ),
                    )
                  : Icon(
                      _isRecording ? Icons.mic : Icons.mic_none,
                      color: _isRecording ? Colors.red : Colors.white,
                      size: 20,
                    ),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.isDark ? "VOICE COMMAND" : "Voice Command",
                style: TextStyle(
                  fontSize: widget.isDark ? 10 : 12,
                  color: widget.isDark ? const Color(0xFF94A3B8) : Colors.grey,
                  fontWeight: widget.isDark
                      ? FontWeight.w600
                      : FontWeight.normal,
                  letterSpacing: widget.isDark ? 0.6 : 0,
                ),
              ),
              Text(
                _statusText,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: widget.isDark ? Colors.white : Colors.blueGrey[900],
                  fontSize: widget.isDark ? 14 : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
