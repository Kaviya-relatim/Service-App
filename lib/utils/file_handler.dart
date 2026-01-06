import 'package:flutter/foundation.dart';
import 'dart:typed_data';

// Conditional import stub
import 'file_handler_stub.dart'
    if (dart.library.io) 'file_handler_io.dart'
    if (dart.library.html) 'file_handler_web.dart';

abstract class FileHandler {
  static Future<Uint8List?> readFile(String path) => readFileBytes(path);
}
