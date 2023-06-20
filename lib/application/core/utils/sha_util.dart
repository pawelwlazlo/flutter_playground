import 'dart:convert';

import 'package:crypto/crypto.dart';

class ShaUtil {
  static String getSha256(String input) {
    var bytes = utf8.encode(input); // data being hashed
    var digest = sha256.convert(bytes);
    return digest.toString();
  }
}