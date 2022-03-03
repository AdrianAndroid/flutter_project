import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:path_drawing/path_drawing.dart';

typedef PathBuilder = Path Function(Size);

enum BorderType { Circle, RRect, Rect, Oval }

class _DashPainter extends CustomPainter {
  final double strokeWidth;
  final List<double> dashPattern;
  final Color color;
  final BorderType borderType;
  final Radius radius;
  final StrokeCap strokeCap;
  final PathBuilder? customPath;

  _DashPainter({
    this.strokeWidth = 2,
    this.dashPattern = const <double>[3, 1],
    this.color = Colors.black,
    this.borderType = BorderType.Rect,
    this.radius = const Radius.circular(0),
    this.strokeCap = StrokeCap.butt,
    this.customPath,
  }) {
    assert(dashPattern.isNotEmpty, 'Dash Pattern cannot be empty');
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..strokeWidth = strokeWidth
      ..color = color
      ..strokeCap = strokeCap
      ..style = PaintingStyle.stroke;

    Path _path;
    if (customPath != null) {
      _path = dashPath(
        customPath!(size),
        dashArray: CircularIntervalList(dashPattern),
      );
    } else {
      _path = _getPath(size);
    }
    canvas.drawPath(_path, paint);
  }

  /// Returns a [Path] based on the [borderType] parameter
  Path _getPath(Size size) {
    Path path;
    switch (borderType) {
      case BorderType.Circle:
        path = _getCirclePath(size);
        break;
      case BorderType.RRect:
        path = _getRRectPath(size, radius);
        break;
      case BorderType.Rect:
        path = _getRectPath(size);
        break;
      case BorderType.Oval:
        path = _getOvalPath(size);
        break;
    }
    return dashPath(path, dashArray: CircularIntervalList(dashPattern));
  }

  /// Returns a circular path of [size]
  Path _getCirclePath(Size size) {
    double w = size.width;
    double h = size.height;
    double s = size.shortestSide;

    return Path()
      ..addRRect(RRect.fromRectAndRadius(
        Rect.fromLTWH(
          w > s ? (w - s) / 2 : 0,
          h > s ? (h - s) / 2 : 0,
          s,
          s,
        ),
        Radius.circular(s / 2),
      ));
  }

  /// Returns a circular path of [size]
  Path _getRRectPath(Size size, Radius radius) {
    RRect rRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        0,
        0,
        size.width,
        size.height,
      ),
      radius,
    );
    return Path()..addRRect(rRect);
  }

  /// Returns a path of [size]
  Path _getRectPath(Size size) {
    Rect rect = Rect.fromLTWH(
      0,
      0,
      size.width,
      size.height,
    );
    return Path()..addRect(rect);
  }

  /// Return on oval path of [size]
  Path _getOvalPath(Size size) {
    Rect oval = Rect.fromLTWH(
      0,
      0,
      size.width,
      size.height,
    );
    return Path()..addOval(oval);
  }

  @override
  bool shouldRepaint(covariant _DashPainter oldDelegate) {
    return oldDelegate.strokeWidth != this.strokeWidth ||
        oldDelegate.color != this.color ||
        oldDelegate.dashPattern != this.dashPattern ||
        oldDelegate.borderType != this.borderType;
  }
}

class DottedBorder extends StatelessWidget {
  final Widget child;
  final EdgeInsets padding;
  final double strokeWidth;
  final Color color;
  final List<double> dashPattern;
  final BorderType borderType;
  final Radius radius;
  final StrokeCap strokeCap;
  final PathBuilder? customPath;

  const DottedBorder({
    Key? key,
    required this.child,
    this.color = Colors.black,
    this.strokeWidth = 1,
    this.borderType = BorderType.Rect,
    this.dashPattern = const <double>[3, 1],
    this.padding = const EdgeInsets.all(2),
    this.radius = const Radius.circular(0),
    this.strokeCap = StrokeCap.butt,
    this.customPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: CustomPaint(
            painter: _DashPainter(
              strokeWidth: strokeWidth,
              radius: radius,
              color: color,
              borderType: borderType,
              dashPattern: dashPattern,
              customPath: customPath,
              strokeCap: strokeCap,
            ),
          ),
        ),
        Padding(padding: padding, child: child),
      ],
    );
  }

  /// Compute if [dashPattern] is valid. The following conditions need to be met
  /// * Cannot be null or empty
  /// * if [dashPattern] has only 1 element, it cannot be 0
  bool _isValidDshPattern(List<double>? dashPattern) {
    Set<double>? _dashSet = dashPattern?.toSet();
    if (_dashSet == null) return false;
    if (_dashSet.length == 1 && _dashSet.elementAt(0) == 0.0) return false;
    if (_dashSet.length == 0) return false;
    return true;
  }
}
