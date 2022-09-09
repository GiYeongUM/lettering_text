import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

enum FontType {
  helvetica,
}

class TextAnimated extends StatefulWidget {
  final Animation<double> progress;
  final double size;
  final Color? color;
  final double? strokeWidth;
  final FontType fontType;

  const TextAnimated(
      {Key? key,
      required this.progress,
      required this.size,
      this.color,
      this.strokeWidth,
      required this.fontType})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => TextAnimatedState();
}

class TextAnimatedState extends State<TextAnimated>
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
      case FontType.helvetica:
        return CustomPaint(
            foregroundPainter: AnimatedHelveticaPathPainter(widget.progress,
                widget.color ?? theme.primaryColor, widget.strokeWidth),
            child: MeasureSize(
              onChange: (Size size) {
                print(size);
              },
              child: SizedBox(
                width: widget.size,
                height: widget.size,
              ),
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

class AnimatedHelveticaPathPainter extends CustomPainter {
  final Animation<double> _animation;
  final Color _color;
  final double? strokeWidth;

  AnimatedHelveticaPathPainter(this._animation, this._color, this.strokeWidth)
      : super(repaint: _animation);

  Path _createAnyPath(Size size) {
    return Path()
      ..moveTo(0.33 * size.width, 0.54 * size.height)
      ..quadraticBezierTo(0.33 * size.width, 0.54 * size.height, 0.335 * size.width, 0.51 * size.height)
      ..quadraticBezierTo(0.335 * size.width, 0.51 * size.height, 0.345 * size.width, 0.48 * size.height)
      ..quadraticBezierTo(0.345 * size.width, 0.48 * size.height, 0.36 * size.width, 0.46 * size.height)
      ..quadraticBezierTo(0.36 * size.width, 0.46 * size.height, 0.38 * size.width, 0.44 * size.height)
      ..quadraticBezierTo(0.38 * size.width, 0.44 * size.height, 0.42 * size.width, 0.42 * size.height)
      ..quadraticBezierTo(0.42 * size.width, 0.42 * size.height, 0.46 * size.width, 0.41 * size.height)
      ..quadraticBezierTo(0.46 * size.width, 0.41 * size.height, 0.5 * size.width, 0.41 * size.height)
      ..quadraticBezierTo(0.5 * size.width, 0.41 * size.height, 0.54 * size.width, 0.415 * size.height)
      ..quadraticBezierTo(0.54 * size.width, 0.415 * size.height, 0.59 * size.width, 0.43 * size.height)
      ..quadraticBezierTo(0.59 * size.width, 0.43 * size.height, 0.625 * size.width, 0.45 * size.height)
      ..quadraticBezierTo(0.625 * size.width, 0.45 * size.height, 0.645 * size.width, 0.48 * size.height)
      ..quadraticBezierTo(0.645 * size.width, 0.48 * size.height, 0.655 * size.width, 0.51 * size.height)
      ..quadraticBezierTo(0.655 * size.width, 0.51 * size.height, 0.655 * size.width, 0.55 * size.height)
      ..lineTo(0.655 * size.width, 0.85 * size.height)

    ;
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
