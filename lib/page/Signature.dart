import 'package:flutter/material.dart';

class Signature extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SignatureState();
  }
}

class SignatureState extends State<Signature> {
  @override
  Widget build(BuildContext context) {
    List<Offset> _points = <Offset>[];
    return new Stack(children: [
      GestureDetector(
        onPanUpdate: (DragUpdateDetails detials) {
          setState(() {
            RenderBox referenceBox = context.findRenderObject();
            Offset loaclPosition =
                referenceBox.globalToLocal(detials.globalPosition);
            _points = new List.from(_points)..add(loaclPosition);
          });
        },
        onPanEnd: (DragEndDetails details) => _points.add(null),
//        child: new CustomPaint(
//          painter: SignaturePainter(_points),
//        ),
      ),
      CustomPaint(painter: SignaturePainter(_points), size: Size.infinite),
    ]);
  }
}

class SignaturePainter extends CustomPainter {
  SignaturePainter(this.points);

  final List<Offset> points;

  @override
  void paint(Canvas canvas, Size size) {
    var paint = new Paint()
      ..color = Colors.black
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 5.0;
    for (int i = 0; i < points.length - 1; i++) {
      if (points[i] != null && points[i + 1] != null) {
        canvas.drawLine(points[i], points[i + 1], paint);
      }
    }
  }

  @override
  bool shouldRepaint(SignaturePainter oldDelegate) {
    return oldDelegate.points != points;
  }
}
