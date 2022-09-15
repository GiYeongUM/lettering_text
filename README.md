# lettering_text
Flutter animated lettering texts

[![Flutter](https://img.shields.io/badge/Platform-Flutter-blue.svg)](https://flutter.dev/)

## font lists

- 🔧 NotoSans_KR (Developing)


## ⚡ [Installation](https://flutter.dev/docs/development/packages-and-plugins/using-packages)

// not yet updated
```yaml
dependencies:
  lettering_text: ^<latest_version>
```

## 📷 GIF

<img width="308" alt="" src="https://github.com/GiYeongUM/lettering_text/raw/main/images/lettering_text.gif">


## 💪 Use

1. Set animation
``` dart
class _FooClassState extends State<FooClass> with SingleTickerProviderStateMixin {

  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState()  {
    _animationController = AnimationController(vsync: this, duration: const Duration(milliseconds: 700));
    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOutCirc));
    super.initState();
  }

  void _showIcon() {
    _animationController.forward();
  }
  
  ...
```

2. add widget
``` dart
KRTextAnimated(
  color: Colors.black,
  progress: _animation,
  size: 30,
  fontType: FontType.notoSans,
  text: "나",
),
```

3. trigger widget animation
``` dart
_showAnimation()

/// If you want to do the reverse
/// do this
/// _animationController.reverse();
```

## 📋Notice

This package can be used for commercial purposes.
We're going to add a new font every update.
If you need any fonts, send to **eomky2005@gmail.com** via email or **Git Issue**.
