import 'dart:convert';

import 'package:flutter/widgets.dart';

class Base64Utils {
  static Image base64ToImage(String base64) {
    // 去掉data:image/png;base64, 前缀
    base64 = base64.replaceFirst('data:image/png;base64,', '');
    return Image.memory(
      base64Decode(base64),
      fit: BoxFit.cover,
    );
  }
}