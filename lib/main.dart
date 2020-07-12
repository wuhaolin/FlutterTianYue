import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:tianyue/app/app_scene.dart';

void main() {
  runApp(AppScene());

  if (Platform.isAndroid) {
    // 系统UI覆盖样式
    SystemUiOverlayStyle style = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}
