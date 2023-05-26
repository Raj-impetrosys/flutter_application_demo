import 'dart:async';

import 'package:flutter/material.dart';
import 'dart:ui' as s;
// import 'package:flutter/painting.dart' as p;

class PaintScreen extends StatefulWidget {
  const PaintScreen({super.key});

  @override
  State<PaintScreen> createState() => _PaintScreenState();
}

class _PaintScreenState extends State<PaintScreen> {
  DragStartDetails? dragStartDetails;
  DragUpdateDetails? dragUpdateDetails;
  List<Offset> points = [];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        // appBar: AppBar(
        //   title: Text("Paint"),
        // ),
        body: GestureDetector(
      onPanStart: (details) {
        dragStartDetails = details;
      },
      onPanUpdate: (details) {
        dragUpdateDetails = details;
        points.add(details.localPosition);
        setState(() {});
      },
      child: CustomPaint(
        size: Size(width, height),
        painter: AlphabetPainter(
          isFilled: false,
          details: dragStartDetails,
          dragUpdateDetails: dragUpdateDetails,
          points: points,
        ),
        // foregroundPainter: AlphabetPainter(),
        // child:
        //     Opacity(opacity: 1, child: Image.asset("assets/images/office.jpeg")),
      ),
    ));
  }
}

class AlphabetPainter extends CustomPainter {
  final DragStartDetails? details;
  final DragUpdateDetails? dragUpdateDetails;
  final bool isFilled;
  final List<Offset> points;
  AlphabetPainter({
    required this.isFilled,
    required this.details,
    required this.dragUpdateDetails,
    required this.points,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    if (isFilled) {
      paint.style = PaintingStyle.fill;
    } else {
      paint.style = PaintingStyle.stroke;
    }
    paint.color = Colors.cyan;
    paint.strokeWidth = 5;
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;
    // paint.maskFilter = const MaskFilter.blur(BlurStyle.inner, 3.0);

    Path path = Path()

      ///inner core
      ..moveTo(size.width / 3, size.height / 2)
      ..lineTo(size.width / 2, size.height / 3)
      ..lineTo(size.width / 1.5, size.height / 2)
      ..close()

      ///outer core
      ..moveTo(size.width / 10, size.height / 1.5)
      ..lineTo(size.width / 2, size.height / 4)
      ..lineTo(size.width / 1.1, size.height / 1.5)
      ..lineTo(size.width / 1.2, size.height / 1.5)
      ..lineTo(size.width / 1.45, size.height / 1.9)
      ..lineTo(size.width / 3.2, size.height / 1.9)
      ..lineTo(size.width / 6, size.height / 1.5)
      ..close();

    // if (isFilled) {
    //   path.lineTo(size.width / 2, size.height / 4);
    // }
    // Timer.periodic(const Duration(seconds: 1), (timer) {
    //   print(timer.tick);
    //   // path.lineTo(size.width / timer.tick, size.height / timer.tick);
    //   path.lineTo(size.width / 2, size.height / 4);
    //   path.moveTo(0, size.height * 0.7);
    //   path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
    //       size.width * 0.5, size.height * 0.8);
    //   path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
    //       size.width * 1.0, size.height * 0.8);
    //   path.lineTo(size.width, size.height);
    //   path.lineTo(0, size.height);
    // });

    Paint newPaint = Paint()
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..color = Colors.green;
    if (isFilled) {
      newPaint.style = PaintingStyle.fill;
    } else {
      newPaint.style = PaintingStyle.stroke;
    }

    // List<Path> pathList = [Path()];
    Path newPath = Path();

    // if (details != null) {
    //   newPath.moveTo(details!.globalPosition.dx, details!.globalPosition.dy);
    //   newPath.lineTo(details!.globalPosition.dx, details!.globalPosition.dy);
    //   // pathList.add(newPath);
    // }

    // if (dragUpdateDetails != null) {
    //   // path.moveTo(dragUpdateDetails!.globalPosition.dx,
    //   //     dragUpdateDetails!.globalPosition.dy);
    //   newPath.lineTo(dragUpdateDetails!.globalPosition.dx,
    //       dragUpdateDetails!.globalPosition.dy);
    //   // canvas.drawPath(newPath, newPaint);
    //   // drawPath(canvas, newPath, newPaint);
    // }
    // path.close();

    for (int i = 0; i < points.length - 1; i++) {
      newPath.moveTo(points[i].dx, points[i].dy);
      newPath.lineTo(points[i].dx, points[i].dy);
    }

    canvas.drawPath(newPath, newPaint);

    // Timer.periodic(const Duration(milliseconds: 1), (timer) {
    //   print(timer.tick);
    //   path.lineTo(timer.tick.toDouble(), timer.tick.toDouble());
    // });

    // final path1 = Path()
    //   ..moveTo(size.width * .6, 0)
    //   ..quadraticBezierTo(
    //     size.width * .7,
    //     size.height * .08,
    //     size.width * .9,
    //     size.height * .05,
    //   )
    //   ..arcToPoint(
    //     Offset(
    //       size.width * .93,
    //       size.height * .15,
    //     ),
    //     radius: Radius.circular(size.height * .05),
    //     largeArc: true,
    //   )
    //   ..cubicTo(
    //     size.width * .6,
    //     size.height * .15,
    //     size.width * .5,
    //     size.height * .46,
    //     0,
    //     size.height * .3,
    //   )
    //   ..lineTo(0, 0)
    //   ..close();

    canvas.drawPath(path, paint);

    List<Offset> pointList = [
      Offset(size.width / 7, size.height / 1.53),
      Offset(size.width / 2, size.height / 3.4),
      Offset(size.width / 1.17, size.height / 1.53),
    ];

    Paint pointPaint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 10
      ..strokeCap = StrokeCap.round;

    s.PointMode pointMode = s.PointMode.points;
    pointList.map((e) => points.contains(e));
    if (points.contains(pointList.map((e) => e))) {}

    canvas.drawPoints(pointMode, pointList, pointPaint);

    // canvas.drawColor(Colors.amber, BlendMode.color);
    // canvas.

    // canvas.drawOval(
    //     Rect.fromCenter(
    //         center: Offset(size.width / 2, size.height / 2),
    //         width: 100,
    //         height: 400),
    //     paint);

    // canvas.drawArc(Rect.fromPoints(Offset(10, 10), Offset(100, 100)), 100, 100,
    //     true, paint);

    // canvas.drawPath(
    //     Path()
    //       ..moveTo(size.width, size.height)
    //       // ..lineTo(0, 0)
    //       // ..lineTo(size.width, 0)
    //       // ..lineTo(0, size.height)
    //       ..quadraticBezierTo(
    //         size.width * .1,
    //         size.height * .1,
    //         size.width * .9,
    //         size.height * .2,
    //       )
    //       ..close(),
    //     paint);

    // canvas.drawRect(
    //     Rect.fromCenter(
    //         center: Offset(size.width / 2, size.height / 2),
    //         width: 200,
    //         height: 100),
    //     paint);

    // canvas.drawCircle(Offset(size.width / 2, size.height / 2), 20, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.black
      ..strokeWidth = 10.0
      ..strokeCap = StrokeCap.round;

    // Draw the letter A.
    canvas.drawPath(
      Path()
        ..moveTo(size.width / 2, size.height / 4)
        ..lineTo(size.width / 2, size.height * 3 / 4)
        ..lineTo(size.width * 3 / 4, size.height / 2),
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class Rectangle extends CustomPainter {
  bool? isFilled;
  Rectangle({this.isFilled});
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    paint.color = Colors.blue;
    if (isFilled != null) {
      paint.style = PaintingStyle.fill;
    } else {
      paint.style = PaintingStyle.stroke;
    }
    paint.strokeCap = StrokeCap.round;
    paint.strokeJoin = StrokeJoin.round;
    paint.strokeWidth = 20;
    Offset offset = Offset(size.width * 0.5, size.height * 0.5);

    Rect rect = Rect.fromCenter(center: offset, width: 200, height: 200);
    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(covariant Rectangle oldDelegate) {
    return false;
  }
}
