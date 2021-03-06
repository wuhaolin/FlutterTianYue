import 'package:flukit/flukit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tianyue/app/root_scene.dart';
import 'package:tianyue/public.dart';

/// 引导页
class GuideScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => GuideSceneState();
}

class GuideSceneState extends State<GuideScene> {

  List<String> imageList = [
    'img/guide1.png',
    'img/guide2.png',
    'img/guide3.png',
    'img/guide4.png',
  ];

  List<String> textList = [
    "动漫陪你每一个夜晚",
    "同你去往每个地方",
    "懂你，更懂你所爱",
    "因为在意，所以用心",
  ];

  // 先构建一个List的Widget
  List<Widget> bannerList = [];

  // 初始化状态
  @override
  void initState() {
    super.initState();
    // 和java里面for循环稍微有些不同，首先需要算出长度
    for (int i = 0, length = imageList.length; i < length; i++) {
      if (i == length - 1) {
        // 最后一页
        bannerList.add(Stack(
          children: <Widget>[
            Image.asset(
              imageList[i],
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Center(
              child: Text(
                // Text里面必须赋值的是data
                textList[i],
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            // 排整齐
            Align(
              child: Container(
                // 手势探测器
                child: GestureDetector(
                  // 为了实现效果，手势探测器里面还需要再使用一个Container
                  child: Container(
                    width: 185,
                    height: 48,
                    decoration: BoxDecoration(
                      border: Border.all(width: 2, color: Colors.white70),
                      color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Text(
                      '立即启程',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    // 容器内部也有对应的功能
                    alignment: Alignment.center,
                  ),
                  // 为了有点击事件，只能再使用GestureDetector
                  onTap: () {
                    goMain();
                  },
                ),
                // 为了有边距间隔，只能再使用Container
                margin: EdgeInsets.only(bottom: 100.0),
              ),
              // 为了有个底部对齐，只能先使用Align
              alignment: Alignment.bottomCenter,
            ),
          ],
        ));
      } else {
        // 如果一个界面属于层叠排版的话，需要使用Stack
        Stack stack = Stack(
          children: <Widget>[
            // asset资产，通过Image可以获取内存、资产、文件和网络里面的图片
            Image.asset(
              // 图片地址是必须要传的
              imageList[i],
              // 无穷大就是屏幕的宽度和高度
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            // 如果一个空间需要放在中间，那么首先想到使用Center
            Center(
              child: Text(
                textList[i],
                // 文本需要使用文本样式
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            )
          ],
        );
        bannerList.add(stack);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    // 脚手架
     return Scaffold(
        body: Swiper(
          children: bannerList,
          indicator: CircleSwiperIndicator(
                radius: 2,
                spacing: 4,
                padding: EdgeInsets.only(bottom: 32.0),
                itemColor: Colors.white,
                itemActiveColor: TYColor.primary,
          ),
          autoStart: false,
          circular: false,
        )
     );
  }

  void goMain() {
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(builder: (BuildContext context) => RootScene()),
        (Route<dynamic> route) => false);
  }
}
