import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class WhisperService {
  // TODO: Replace with your actual Groq or OpenAI API key
  // You can get a free Groq API key at https://console.groq.com/
  static const String _apiKey =
      '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';

  // Groq Endpoint for Whisper
  static const String _uploadUrl =
      'https://api.groq.com/openai/v1/audio/transcriptions';

  Future<String?> transcribeAudio(Uint8List audioBytes, String filename) async {
    try {
      final request = http.MultipartRequest('POST', Uri.parse(_uploadUrl));

      request.headers['Authorization'] = 'Bearer $_apiKey';

      // Add the model field
      request.fields['model'] = 'whisper-large-v3';
      // request.fields['language'] = 'en'; // Optional: specify language

      // Determine mime type from extension or default
      String mimeType = 'audio/m4a';
      if (filename.endsWith('.wav')) mimeType = 'audio/wav';
      if (filename.endsWith('.mp3')) mimeType = 'audio/mpeg';

      // Add the file from bytes
      final multipartFile = http.MultipartFile.fromBytes(
        'file',
        audioBytes,
        filename: filename,
        contentType: MediaType.parse(mimeType),
      );

      request.files.add(multipartFile);

      print(
        "Sending audio to Whisper/Groq API... (${audioBytes.length} bytes)",
      );
      final response = await request.send();
      final responseBody = await response.stream.bytesToString();

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(responseBody);
        final String text = jsonResponse['text'];
        print("Whisper Transcription: $text");
        return text;
      } else {
        print("Whisper API Error: ${response.statusCode} - $responseBody");
        return null;
      }
    } catch (e) {
      print("Error calling Whisper API: $e");
      return null;
    }
  }
}
