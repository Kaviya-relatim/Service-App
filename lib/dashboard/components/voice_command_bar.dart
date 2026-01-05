import 'package:flutter/material.dart';

class VoiceCommandBar extends StatelessWidget {
  final bool isDark;

  const VoiceCommandBar({super.key, this.isDark = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: isDark
            ? const Color(0xFF1E293B).withOpacity(0.9)
            : Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(37),
        border: Border.all(
          color: isDark ? Colors.white10 : Colors.white.withOpacity(0.5),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.05),
            blurRadius: isDark ? 32 : 20,
            offset: Offset(0, isDark ? 8 : 10),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize
            .min, // Wrap content so it doesn't expand full width if not needed
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF137FEC) : Colors.blueAccent,
              shape: BoxShape.circle,
              boxShadow: isDark
                  ? [
                      const BoxShadow(
                        color: Color.fromRGBO(19, 127, 236, 0.5),
                        blurRadius: 15,
                      ),
                    ]
                  : null,
            ),
            child: const Icon(Icons.mic, color: Colors.white, size: 20),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                isDark ? "VOICE COMMAND" : "Voice Command",
                style: TextStyle(
                  fontSize: isDark ? 10 : 12,
                  color: isDark ? const Color(0xFF94A3B8) : Colors.grey,
                  fontWeight: isDark ? FontWeight.w600 : FontWeight.normal,
                  letterSpacing: isDark ? 0.6 : 0,
                ),
              ),
              Text(
                isDark ? 'Say "Open /Accept"' : 'Say "Show scheduled..."',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isDark ? Colors.white : Colors.blueGrey[900],
                  fontSize: isDark ? 14 : null,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
