import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:tianyue/app/app_scene.dart';

void main() {
  // main方法里面调用运行app方法
  runApp(AppScene());

  if (Platform.isAndroid) {
    // 系统UI覆盖样式
    SystemUiOverlayStyle style = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    // 系统浏览器设置系统UI覆盖样式
    SystemChrome.setSystemUIOverlayStyle(style);
  }
}
