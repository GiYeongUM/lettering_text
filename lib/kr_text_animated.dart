import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum FontType {
  notoSans,
}

class KRTextAnimated extends StatefulWidget {
  final Animation<double> progress;
  final double size;
  final Color? color;
  final double? strokeWidth;
  final FontType fontType;
  final String text;

  const KRTextAnimated(
      {Key? key,
      required this.progress,
      required this.size,
      this.color,
      this.strokeWidth,
      required this.fontType, required this.text})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => KRTextAnimatedState();
}

class KRTextAnimatedState extends State<KRTextAnimated>
    with SingleTickerProviderStateMixin {

  var myChildSize = Size.zero;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    switch (widget.fontType) {
      case FontType.notoSans:
        return CustomPaint(
            foregroundPainter: AnimatedNotoSansKRPathPainter(widget.progress,
                widget.color ?? theme.primaryColor, widget.strokeWidth, widget.text),
            child: SizedBox(
              width: widget.size,
              height: widget.size,
            ));
    }
  }
}

typedef OnWidgetSizeChange = void Function(Size size);

class MeasureSizeRenderObject extends RenderProxyBox {
  Size? oldSize;
  final OnWidgetSizeChange onChange;

  MeasureSizeRenderObject(this.onChange);

  @override
  void performLayout() {
    super.performLayout();

    Size newSize = child!.size;
    if (oldSize == newSize) return;

    oldSize = newSize;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      onChange(newSize);
    });
  }
}

class MeasureSize extends SingleChildRenderObjectWidget {
  final OnWidgetSizeChange onChange;

  const MeasureSize({
    Key? key,
    required this.onChange,
    required Widget child,
  }) : super(key: key, child: child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return MeasureSizeRenderObject(onChange);
  }
}

class AnimatedNotoSansKRPathPainter extends CustomPainter {
  final Animation<double> _animation;
  final Color _color;
  final double? strokeWidth;
  final String text;

  AnimatedNotoSansKRPathPainter(this._animation, this._color, this.strokeWidth, this.text)
      : super(repaint: _animation);

  Path _createAnyPath(Size size) {
    switch(text){
      case "가":
        return Path()
          ..moveTo(0.11 * size.width, 0.145 * size.height)
          ..lineTo(0.51 * size.width, 0.145 * size.height)
          ..quadraticBezierTo(0.51 * size.width, 0.145 * size.height, 0.50 * size.width, 0.24 * size.height)
          ..quadraticBezierTo(0.50 * size.width, 0.24 * size.height, 0.485 * size.width, 0.32 * size.height)
          ..quadraticBezierTo(0.485 * size.width, 0.32 * size.height, 0.45 * size.width, 0.41 * size.height)
          ..quadraticBezierTo(0.45 * size.width, 0.41 * size.height, 0.405 * size.width, 0.495 * size.height)
          ..quadraticBezierTo(0.405 * size.width, 0.495 * size.height, 0.345 * size.width, 0.575 * size.height)
          ..quadraticBezierTo(0.345 * size.width, 0.575 * size.height, 0.275 * size.width, 0.645 * size.height)
          ..quadraticBezierTo(0.275 * size.width, 0.645 * size.height, 0.195 * size.width, 0.705 * size.height)
          ..quadraticBezierTo(0.195 * size.width, 0.705 * size.height, 0.11 * size.width, 0.76 * size.height)

          ..moveTo(0.77 * size.width, 0.02 * size.height)
          ..lineTo(0.77 * size.width, 0.98 * size.height)
          ..moveTo(0.77 * size.width, 0.44 * size.height)
          ..lineTo(0.95 * size.width, 0.44 * size.height);
      case "나":
        return Path()
          ..moveTo(0.13 * size.width, 0.12 * size.height)
          ..lineTo(0.13 * size.width, 0.705 * size.height)
          ..quadraticBezierTo(0.13 * size.width, 0.705 * size.height, 0.25 * size.width, 0.705 * size.height)
          ..quadraticBezierTo(0.25 * size.width, 0.705 * size.height, 0.375 * size.width, 0.70 * size.height)
          ..quadraticBezierTo(0.375 * size.width, 0.70 * size.height, 0.50 * size.width, 0.685 * size.height)
          ..quadraticBezierTo(0.50 * size.width, 0.685 * size.height, 0.615 * size.width, 0.665 * size.height)

          ..moveTo(0.77 * size.width, 0.02 * size.height)
          ..lineTo(0.77 * size.width, 0.98 * size.height)
          ..moveTo(0.77 * size.width, 0.44 * size.height)
          ..lineTo(0.95 * size.width, 0.44 * size.height);
      case "다":
        return Path()
          ..moveTo(0.53 * size.width, 0.135 * size.height)
          ..lineTo(0.135 * size.width, 0.135 * size.height)
          ..lineTo(0.135 * size.width, 0.71 * size.height)
          ..quadraticBezierTo(0.135 * size.width, 0.71 * size.height, 0.375 * size.width, 0.71 * size.height)
          ..quadraticBezierTo(0.375 * size.width, 0.71 * size.height, 0.495 * size.width, 0.70 * size.height)
          ..quadraticBezierTo(0.495 * size.width, 0.70 * size.height, 0.605 * size.width, 0.68 * size.height)

          ..moveTo(0.77 * size.width, 0.02 * size.height)
          ..lineTo(0.77 * size.width, 0.98 * size.height)
          ..moveTo(0.77 * size.width, 0.44 * size.height)
          ..lineTo(0.95 * size.width, 0.44 * size.height);
      case "라":
        return Path()
          ..moveTo(0.105 * size.width, 0.13 * size.height)
          ..lineTo(0.49 * size.width, 0.13 * size.height)
          ..lineTo(0.49 * size.width, 0.415 * size.height)
          ..lineTo(0.135 * size.width, 0.415 * size.height)
          ..lineTo(0.135 * size.width, 0.71 * size.height)
          ..quadraticBezierTo(0.135 * size.width, 0.71 * size.height, 0.375 * size.width, 0.71 * size.height)
          ..quadraticBezierTo(0.375 * size.width, 0.71 * size.height, 0.495 * size.width, 0.70 * size.height)
          ..quadraticBezierTo(0.495 * size.width, 0.70 * size.height, 0.605 * size.width, 0.68 * size.height)

          ..moveTo(0.77 * size.width, 0.02 * size.height)
          ..lineTo(0.77 * size.width, 0.98 * size.height)
          ..moveTo(0.77 * size.width, 0.44 * size.height)
          ..lineTo(0.95 * size.width, 0.44 * size.height);
      case "마":
        return Path()
          ..moveTo(0.13 * size.width, 0.135 * size.height)
          ..lineTo(0.13 * size.width, 0.71 * size.height)
          ..moveTo(0.13 * size.width, 0.135 * size.height)
          ..lineTo(0.50 * size.width, 0.135 * size.height)
          ..lineTo(0.50 * size.width, 0.71 * size.height)
          ..moveTo(0.13 * size.width, 0.71 * size.height)
          ..lineTo(0.50 * size.width, 0.71 * size.height)

          ..moveTo(0.77 * size.width, 0.02 * size.height)
          ..lineTo(0.77 * size.width, 0.98 * size.height)
          ..moveTo(0.77 * size.width, 0.44 * size.height)
          ..lineTo(0.95 * size.width, 0.44 * size.height);
      case "바":
        return Path()
          ..moveTo(0.13 * size.width, 0.11 * size.height)
          ..lineTo(0.13 * size.width, 0.72 * size.height)
          ..moveTo(0.51 * size.width, 0.11 * size.height)
          ..lineTo(0.51 * size.width, 0.72 * size.height)
          ..moveTo(0.13 * size.width, 0.38 * size.height)
          ..lineTo(0.51 * size.width, 0.38 * size.height)
          ..moveTo(0.13 * size.width, 0.72 * size.height)
          ..lineTo(0.51 * size.width, 0.72 * size.height)

          ..moveTo(0.77 * size.width, 0.02 * size.height)
          ..lineTo(0.77 * size.width, 0.98 * size.height)
          ..moveTo(0.77 * size.width, 0.44 * size.height)
          ..lineTo(0.95 * size.width, 0.44 * size.height);
      case "사":
        return Path()
          ..moveTo(0.34 * size.width, 0.11 * size.height)
          ..lineTo(0.335 * size.width, 0.36 * size.height)
          ..quadraticBezierTo(0.335 * size.width, 0.36 * size.height, 0.285 * size.width, 0.485 * size.height)
          ..quadraticBezierTo(0.285 * size.width, 0.485 * size.height, 0.235 * size.width, 0.585 * size.height)
          ..quadraticBezierTo(0.235 * size.width, 0.585 * size.height, 0.16 * size.width, 0.67 * size.height)
          ..quadraticBezierTo(0.16 * size.width, 0.67 * size.height, 0.08 * size.width, 0.74 * size.height)
          ..moveTo(0.335 * size.width, 0.36 * size.height)
          ..quadraticBezierTo(0.335 * size.width, 0.36 * size.height, 0.395 * size.width, 0.485 * size.height)
          ..quadraticBezierTo(0.395 * size.width, 0.485 * size.height, 0.45 * size.width, 0.585 * size.height)
          ..quadraticBezierTo(0.45 * size.width, 0.585 * size.height, 0.525 * size.width, 0.67 * size.height)
          ..quadraticBezierTo(0.525 * size.width, 0.67 * size.height, 0.59 * size.width, 0.72 * size.height)

          ..moveTo(0.77 * size.width, 0.02 * size.height)
          ..lineTo(0.77 * size.width, 0.98 * size.height)
          ..moveTo(0.77 * size.width, 0.44 * size.height)
          ..lineTo(0.95 * size.width, 0.44 * size.height);
      case "아":
        return Path()
          ..moveTo(0.31 * size.width, 0.12 * size.height)
          ..quadraticBezierTo(0.31 * size.width, 0.12 * size.height, 0.21 * size.width, 0.15 * size.height)
          ..quadraticBezierTo(0.21 * size.width, 0.15 * size.height, 0.15 * size.width, 0.23 * size.height)
          ..quadraticBezierTo(0.15 * size.width, 0.23 * size.height, 0.115 * size.width, 0.335 * size.height)
          ..quadraticBezierTo(0.115 * size.width, 0.335 * size.height, 0.105 * size.width, 0.435 * size.height)
          ..quadraticBezierTo(0.105 * size.width, 0.435 * size.height, 0.115 * size.width, 0.53 * size.height)
          ..quadraticBezierTo(0.115 * size.width, 0.53 * size.height, 0.15 * size.width, 0.62 * size.height)
          ..quadraticBezierTo(0.15 * size.width, 0.62 * size.height, 0.21 * size.width, 0.695 * size.height)
          ..quadraticBezierTo(0.21 * size.width, 0.695 * size.height, 0.31 * size.width, 0.73 * size.height)
          ..quadraticBezierTo(0.31 * size.width, 0.73 * size.height, 0.41 * size.width, 0.695 * size.height)
          ..quadraticBezierTo(0.41 * size.width, 0.695 * size.height, 0.48 * size.width, 0.62 * size.height)
          ..quadraticBezierTo(0.48 * size.width, 0.62 * size.height, 0.51 * size.width, 0.525 * size.height)
          ..quadraticBezierTo(0.51 * size.width, 0.525 * size.height, 0.52 * size.width, 0.435 * size.height)
          ..quadraticBezierTo(0.52 * size.width, 0.435 * size.height, 0.51 * size.width, 0.335 * size.height)
          ..quadraticBezierTo(0.51 * size.width, 0.335 * size.height, 0.48 * size.width, 0.23 * size.height)
          ..quadraticBezierTo(0.48 * size.width, 0.23 * size.height, 0.41 * size.width, 0.15 * size.height)
          ..quadraticBezierTo(0.41 * size.width, 0.15 * size.height, 0.31 * size.width, 0.12 * size.height)

          ..moveTo(0.77 * size.width, 0.02 * size.height)
          ..lineTo(0.77 * size.width, 0.98 * size.height)
          ..moveTo(0.77 * size.width, 0.44 * size.height)
          ..lineTo(0.95 * size.width, 0.44 * size.height);
      case "자":
        return Path()
          ..moveTo(0.09 * size.width, 0.14 * size.height)
          ..lineTo(0.58 * size.width, 0.14 * size.height)
          ..moveTo(0.34 * size.width, 0.14 * size.height)
          ..lineTo(0.335 * size.width, 0.36 * size.height)
          ..quadraticBezierTo(0.335 * size.width, 0.36 * size.height, 0.285 * size.width, 0.485 * size.height)
          ..quadraticBezierTo(0.285 * size.width, 0.485 * size.height, 0.235 * size.width, 0.585 * size.height)
          ..quadraticBezierTo(0.235 * size.width, 0.585 * size.height, 0.16 * size.width, 0.67 * size.height)
          ..quadraticBezierTo(0.16 * size.width, 0.67 * size.height, 0.08 * size.width, 0.74 * size.height)
          ..moveTo(0.335 * size.width, 0.36 * size.height)
          ..quadraticBezierTo(0.335 * size.width, 0.36 * size.height, 0.395 * size.width, 0.485 * size.height)
          ..quadraticBezierTo(0.395 * size.width, 0.485 * size.height, 0.45 * size.width, 0.585 * size.height)
          ..quadraticBezierTo(0.45 * size.width, 0.585 * size.height, 0.525 * size.width, 0.67 * size.height)
          ..quadraticBezierTo(0.525 * size.width, 0.67 * size.height, 0.59 * size.width, 0.72 * size.height)

          ..moveTo(0.77 * size.width, 0.02 * size.height)
          ..lineTo(0.77 * size.width, 0.98 * size.height)
          ..moveTo(0.77 * size.width, 0.44 * size.height)
          ..lineTo(0.95 * size.width, 0.44 * size.height);
      case "차":
        return Path()
          ..moveTo(0.34 * size.width, 0.10 * size.height)
          ..lineTo(0.335 * size.width, 0.36 * size.height)
          ..quadraticBezierTo(0.335 * size.width, 0.36 * size.height, 0.285 * size.width, 0.485 * size.height)
          ..quadraticBezierTo(0.285 * size.width, 0.485 * size.height, 0.235 * size.width, 0.585 * size.height)
          ..quadraticBezierTo(0.235 * size.width, 0.585 * size.height, 0.16 * size.width, 0.67 * size.height)
          ..quadraticBezierTo(0.16 * size.width, 0.67 * size.height, 0.08 * size.width, 0.74 * size.height)
          ..moveTo(0.335 * size.width, 0.36 * size.height)
          ..quadraticBezierTo(0.335 * size.width, 0.36 * size.height, 0.395 * size.width, 0.485 * size.height)
          ..quadraticBezierTo(0.395 * size.width, 0.485 * size.height, 0.45 * size.width, 0.585 * size.height)
          ..quadraticBezierTo(0.45 * size.width, 0.585 * size.height, 0.525 * size.width, 0.67 * size.height)
          ..quadraticBezierTo(0.525 * size.width, 0.67 * size.height, 0.59 * size.width, 0.72 * size.height)
          ..moveTo(0.09 * size.width, 0.21 * size.height)
          ..lineTo(0.58 * size.width, 0.21 * size.height)

          ..moveTo(0.77 * size.width, 0.02 * size.height)
          ..lineTo(0.77 * size.width, 0.98 * size.height)
          ..moveTo(0.77 * size.width, 0.44 * size.height)
          ..lineTo(0.95 * size.width, 0.44 * size.height);
      case "카":
        return Path()
          ..moveTo(0.13 * size.width, 0.14 * size.height)
          ..lineTo(0.52 * size.width, 0.14 * size.height)
          ..quadraticBezierTo(0.52 * size.width, 0.14 * size.height, 0.515 * size.width, 0.195 * size.height)
          ..quadraticBezierTo(0.515 * size.width, 0.195 * size.height, 0.51 * size.width, 0.2475 * size.height)
          ..quadraticBezierTo(0.51 * size.width, 0.2475 * size.height, 0.50 * size.width, 0.30 * size.height)
          ..quadraticBezierTo(0.50 * size.width, 0.30 * size.height, 0.485 * size.width, 0.355 * size.height)
          ..quadraticBezierTo(0.485 * size.width, 0.355 * size.height, 0.475 * size.width, 0.385 * size.height)
          ..quadraticBezierTo(0.475 * size.width, 0.385 * size.height, 0.445 * size.width, 0.455 * size.height)
          ..quadraticBezierTo(0.445 * size.width, 0.455 * size.height, 0.395 * size.width, 0.545 * size.height)
          ..quadraticBezierTo(0.395 * size.width, 0.545 * size.height, 0.335 * size.width, 0.615 * size.height)
          ..quadraticBezierTo(0.335 * size.width, 0.615 * size.height, 0.265 * size.width, 0.685 * size.height)
          ..quadraticBezierTo(0.265 * size.width, 0.685 * size.height, 0.18 * size.width, 0.74 * size.height)
          ..quadraticBezierTo(0.18 * size.width, 0.74 * size.height, 0.105 * size.width, 0.785 * size.height)
          ..moveTo(0.475 * size.width, 0.385 * size.height)
          ..lineTo(0.095 * size.width, 0.415 * size.height)


          ..moveTo(0.77 * size.width, 0.02 * size.height)
          ..lineTo(0.77 * size.width, 0.98 * size.height)
          ..moveTo(0.77 * size.width, 0.44 * size.height)
          ..lineTo(0.95 * size.width, 0.44 * size.height);
      case "타":
        return Path()
          ..moveTo(0.53 * size.width, 0.135 * size.height)
          ..lineTo(0.135 * size.width, 0.135 * size.height)
          ..lineTo(0.135 * size.width, 0.71 * size.height)
          ..quadraticBezierTo(0.135 * size.width, 0.71 * size.height, 0.375 * size.width, 0.71 * size.height)
          ..quadraticBezierTo(0.375 * size.width, 0.71 * size.height, 0.495 * size.width, 0.70 * size.height)
          ..quadraticBezierTo(0.495 * size.width, 0.70 * size.height, 0.605 * size.width, 0.68 * size.height)
          ..moveTo(0.135 * size.width, 0.405 * size.height)
          ..lineTo(0.515 * size.width, 0.405 * size.height)

          ..moveTo(0.77 * size.width, 0.02 * size.height)
          ..lineTo(0.77 * size.width, 0.98 * size.height)
          ..moveTo(0.77 * size.width, 0.44 * size.height)
          ..lineTo(0.95 * size.width, 0.44 * size.height);
      case "파":
        return Path()
          ..moveTo(0.075 * size.width, 0.145 * size.height)
          ..lineTo(0.595 * size.width, 0.145 * size.height)
          ..moveTo(0.215 * size.width, 0.145 * size.height)
          ..lineTo(0.215 * size.width, 0.705 * size.height)
          ..moveTo(0.465 * size.width, 0.145 * size.height)
          ..lineTo(0.465 * size.width, 0.700 * size.height)
          ..moveTo(0.055 * size.width, 0.715 * size.height)
          ..quadraticBezierTo(0.055 * size.width, 0.715 * size.height, 0.205 * size.width, 0.71 * size.height)
          ..quadraticBezierTo(0.205 * size.width, 0.71 * size.height, 0.35 * size.width, 0.705 * size.height)
          ..quadraticBezierTo(0.35 * size.width, 0.705 * size.height, 0.50 * size.width, 0.695 * size.height)
          ..quadraticBezierTo(0.50 * size.width, 0.695 * size.height, 0.65 * size.width, 0.68 * size.height)

          ..moveTo(0.77 * size.width, 0.02 * size.height)
          ..lineTo(0.77 * size.width, 0.98 * size.height)
          ..moveTo(0.77 * size.width, 0.44 * size.height)
          ..lineTo(0.95 * size.width, 0.44 * size.height);
      case "하":
        return Path()
          ..moveTo(0.06 * size.width, 0.195 * size.height)
          ..lineTo(0.615 * size.width, 0.195 * size.height)
          ..moveTo(0.34 * size.width, 0.03 * size.height)
          ..lineTo(0.34 * size.width, 0.195 * size.height)
          ..addOval(Rect.fromCircle(
            center: Offset(0.34 * size.width, 0.545 * size.height),
            radius: 0.2 * size.width,
          ))

          ..moveTo(0.77 * size.width, 0.02 * size.height)
          ..lineTo(0.77 * size.width, 0.98 * size.height)
          ..moveTo(0.77 * size.width, 0.44 * size.height)
          ..lineTo(0.95 * size.width, 0.44 * size.height);
      default:
        return Path()
          ..moveTo(0.13 * size.width, 0.12 * size.height)
          ..lineTo(0.13 * size.width, 0.705 * size.height)
          ..quadraticBezierTo(0.13 * size.width, 0.705 * size.height, 0.25 * size.width, 0.71 * size.height)
          ..quadraticBezierTo(0.25 * size.width, 0.71 * size.height, 0.375 * size.width, 0.70 * size.height)
          ..quadraticBezierTo(0.375 * size.width, 0.70 * size.height, 0.50 * size.width, 0.685 * size.height)
          ..quadraticBezierTo(0.50 * size.width, 0.685 * size.height, 0.615 * size.width, 0.665 * size.height);
    }


  }

  Path createAnimatedPath(Path originalPath, double animationPercent) {
    final totalLength = originalPath
        .computeMetrics()
        .fold(0.0, (double prev, PathMetric metric) => prev + metric.length);

    final currentLength = totalLength * animationPercent;

    return extractPathUntilLength(originalPath, currentLength);
  }

  Path extractPathUntilLength(Path originalPath, double length) {
    var currentLength = 0.0;

    final path = Path();

    var metricsIterator = originalPath.computeMetrics().iterator;

    while (metricsIterator.moveNext()) {
      var metric = metricsIterator.current;

      var nextLength = currentLength + metric.length;

      final isLastSegment = nextLength > length;
      if (isLastSegment) {
        final remainingLength = length - currentLength;
        final pathSegment = metric.extractPath(0.0, remainingLength);

        path.addPath(pathSegment, Offset.zero);
        break;
      } else {
        final pathSegment = metric.extractPath(0.0, metric.length);
        path.addPath(pathSegment, Offset.zero);
      }

      currentLength = nextLength;
    }

    return path;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final animationPercent = _animation.value;

    final path = createAnimatedPath(_createAnyPath(size), animationPercent);

    final Paint paint = Paint();
    paint.color = _color;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = strokeWidth ?? size.width * 0.06;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
