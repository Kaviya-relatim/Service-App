import 'dart:typed_data';
import 'package:http/http.dart' as http;

Future<Uint8List?> readFileBytes(String path) async {
  // On web, the 'path' from record package is a Blob URL
  try {
    final response = await http.get(Uri.parse(path));
    if (response.statusCode == 200) {
      return response.bodyBytes;
    }
  } catch (e) {
    print('Error reading blob url: $e');
  }
  return null;
}
