import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:lettering_text/kr_text_animated.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Widget Demo Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Widget Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;
  late bool isOn;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1200));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
        parent: _animationController, curve: Curves.easeInOutCirc));
    isOn = false;
    _showAnimation();
    super.initState();
  }

  void _showAnimation() {
    _animationController.forward();
    setState(() {
      isOn = true;
    });
  }

  void _reverseAnimation() {
    _animationController.reverse();
    setState(() {
      isOn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              InkWell(
                onTap: (){
                  isOn ? _reverseAnimation() : _showAnimation();

                },
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 14,
                  children: [
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "가",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "나",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "다",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "라",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "마",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "바",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "사",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "아",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "자",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "차",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "카",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "타",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "파",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "하"
                    ),

                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "갸",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "냐",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "댜",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "랴",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "먀",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "뱌",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "샤",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "야",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "쟈",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "챠",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "캬",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "탸",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "퍄",
                    ),
                    KRTextAnimated(
                        color: Colors.black,
                        progress: _animation,
                        size: 30,
                        fontType: FontType.notoSans,
                        text: "햐"
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "거",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "너",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "더",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "러",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "머",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "버",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "서",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "어",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "저",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "처",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "커",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "터",
                    ),
                    KRTextAnimated(
                      color: Colors.black,
                      progress: _animation,
                      size: 30,
                      fontType: FontType.notoSans,
                      text: "퍼",
                    ),
                    KRTextAnimated(
                        color: Colors.black,
                        progress: _animation,
                        size: 30,
                        fontType: FontType.notoSans,
                        text: "허"
                    ),
                    KRTextAnimated(
                        color: Colors.black,
                        progress: _animation,
                        size: 30,
                        fontType: FontType.notoSans,
                        text: "겨"
                    ),
                    KRTextAnimated(
                        color: Colors.black,
                        progress: _animation,
                        size: 30,
                        fontType: FontType.notoSans,
                        text: "녀"
                    ),
                    KRTextAnimated(
                        color: Colors.black,
                        progress: _animation,
                        size: 30,
                        fontType: FontType.notoSans,
                        text: "뎌"
                    ),
                    KRTextAnimated(
                        color: Colors.black,
                        progress: _animation,
                        size: 30,
                        fontType: FontType.notoSans,
                        text: "려"
                    ),
                    KRTextAnimated(
                        color: Colors.black,
                        progress: _animation,
                        size: 30,
                        fontType: FontType.notoSans,
                        text: "며"
                    ),
                    KRTextAnimated(
                        color: Colors.black,
                        progress: _animation,
                        size: 30,
                        fontType: FontType.notoSans,
                        text: "벼"
                    ),
                    KRTextAnimated(
                        color: Colors.black,
                        progress: _animation,
                        size: 30,
                        fontType: FontType.notoSans,
                        text: "셔"
                    ),
                    KRTextAnimated(
                        color: Colors.black,
                        progress: _animation,
                        size: 30,
                        fontType: FontType.notoSans,
                        text: "여"
                    ),
                    KRTextAnimated(
                        color: Colors.black,
                        progress: _animation,
                        size: 30,
                        fontType: FontType.notoSans,
                        text: "져"
                    ),
                    KRTextAnimated(
                        color: Colors.black,
                        progress: _animation,
                        size: 30,
                        fontType: FontType.notoSans,
                        text: "쳐"
                    ),
                    KRTextAnimated(
                        color: Colors.black,
                        progress: _animation,
                        size: 30,
                        fontType: FontType.notoSans,
                        text: "켜"
                    ),
                    KRTextAnimated(
                        color: Colors.black,
                        progress: _animation,
                        size: 30,
                        fontType: FontType.notoSans,
                        text: "텨"
                    ),
                    KRTextAnimated(
                        color: Colors.black,
                        progress: _animation,
                        size: 30,
                        fontType: FontType.notoSans,
                        text: "펴"
                    ),
                    KRTextAnimated(
                        color: Colors.black,
                        progress: _animation,
                        size: 30,
                        fontType: FontType.notoSans,
                        text: "혀"
                    ),
                    // KRTextAnimated(
                    //     color: Colors.black,
                    //     progress: _animation,
                    //     size: 30,
                    //     fontType: FontType.notoSans,
                    //     text: "고"
                    // ),
                    // KRTextAnimated(
                    //     color: Colors.black,
                    //     progress: _animation,
                    //     size: 30,
                    //     fontType: FontType.notoSans,
                    //     text: "노"
                    // ),
                    // KRTextAnimated(
                    //     color: Colors.black,
                    //     progress: _animation,
                    //     size: 30,
                    //     fontType: FontType.notoSans,
                    //     text: "도"
                    // ),
                    // KRTextAnimated(
                    //     color: Colors.black,
                    //     progress: _animation,
                    //     size: 30,
                    //     fontType: FontType.notoSans,
                    //     text: "로"
                    // ),
                    // KRTextAnimated(
                    //     color: Colors.black,
                    //     progress: _animation,
                    //     size: 30,
                    //     fontType: FontType.notoSans,
                    //     text: "모"
                    // ),
                    // KRTextAnimated(
                    //     color: Colors.black,
                    //     progress: _animation,
                    //     size: 30,
                    //     fontType: FontType.notoSans,
                    //     text: "보"
                    // ),
                    // KRTextAnimated(
                    //     color: Colors.black,
                    //     progress: _animation,
                    //     size: 30,
                    //     fontType: FontType.notoSans,
                    //     text: "소"
                    // ),
                    // KRTextAnimated(
                    //     color: Colors.black,
                    //     progress: _animation,
                    //     size: 30,
                    //     fontType: FontType.notoSans,
                    //     text: "오"
                    // ),
                    // KRTextAnimated(
                    //     color: Colors.black,
                    //     progress: _animation,
                    //     size: 30,
                    //     fontType: FontType.notoSans,
                    //     text: "조"
                    // ),
                    // KRTextAnimated(
                    //     color: Colors.black,
                    //     progress: _animation,
                    //     size: 30,
                    //     fontType: FontType.notoSans,
                    //     text: "초"
                    // ),
                    // KRTextAnimated(
                    //     color: Colors.black,
                    //     progress: _animation,
                    //     size: 30,
                    //     fontType: FontType.notoSans,
                    //     text: "코"
                    // ),
                    // KRTextAnimated(
                    //     color: Colors.black,
                    //     progress: _animation,
                    //     size: 30,
                    //     fontType: FontType.notoSans,
                    //     text: "토"
                    // ),
                    // KRTextAnimated(
                    //     color: Colors.black,
                    //     progress: _animation,
                    //     size: 30,
                    //     fontType: FontType.notoSans,
                    //     text: "포"
                    // ),
                    // KRTextAnimated(
                    //     color: Colors.black,
                    //     progress: _animation,
                    //     size: 30,
                    //     fontType: FontType.notoSans,
                    //     text: "호"
                    // ),
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

