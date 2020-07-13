import 'package:flutter/material.dart';
import 'package:tianyue/app/guide_scene.dart';
import 'package:tianyue/public.dart';

// app场景
class AppScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // 物料app是一个大的控件
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        scaffoldBackgroundColor: TYColor.paper,
      ),
      home: GuideScene(),
    );
  }
}
