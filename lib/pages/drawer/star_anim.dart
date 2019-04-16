import 'dart:ui';

import 'package:flutter/material.dart';

class StarView extends StatefulWidget {
  @override
  _StarViewState createState() => _StarViewState();
}


class _StarViewState extends State<StarView> {
  List<Offset> mTapPosition = <Offset>[];
  @override
  Widget build(BuildContext context) {

    final logicalSize = MediaQuery.of(context).size;
    final double _width = logicalSize.width;
    final double _height = logicalSize.height;
    final h = MediaQueryData.fromWindow(window).padding.top;
    AppBar appBar = AppBar(title: Text("自定义-心"),);
    return Scaffold(
      appBar: appBar,
      body: Container(
        color: Colors.amberAccent,
        width: _width,
        height: _height,
        child: GestureDetector(
          onTapUp: (event){
//            print('onTapUp');
            setState(() {
              RenderBox currentArea = context.findRenderObject();
              var oSize = currentArea.globalToLocal(event.globalPosition);

              oSize = Offset(oSize.dx,oSize.dy-appBar.preferredSize.height-h);
              mTapPosition = List.from(mTapPosition)..add(oSize);
            });

          },
          child: CustomPaint(
            painter: MyHeartView(points: mTapPosition),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.clear),
          onPressed: () {
            mTapPosition.clear();
          }),
    );
  }
}


class MyHeartView extends CustomPainter{

  Paint mPointPaint = Paint()
    ..color = Color(0xffff0000)
    ..strokeWidth = 5.0
    ..strokeCap = StrokeCap.round;
  List<Offset> points;
  int width = 30;
  int height = 30;

  MyHeartView({@required this.points});
  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < points.length; i++) {
      if (points[i] != null) {
        Path path = Path();
        path.moveTo(points[i].dx, points[i].dy - height / 6);
        path.cubicTo(
            points[i].dx + width * 5 / 14,
            points[i].dy - height * 7 / 18,
            points[i].dx + width / 2,
            points[i].dy - height / 10,
            points[i].dx,
            points[i].dy + width / 2);
        canvas.drawPath(path, mPointPaint);
        Path path2 = new Path();
        path2.moveTo(points[i].dx, points[i].dy - height / 6);
        path2.cubicTo(
            points[i].dx - width * 5 / 14,
            points[i].dy - height * 7 / 18,
            points[i].dx - width / 2,
            points[i].dy - height / 10,
            points[i].dx,
            points[i].dy + width / 2);
        canvas.drawPath(path2, mPointPaint);
      }
    }
  }

  @override
  bool shouldRepaint(MyHeartView oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate.points != points;;
  }

}

class MyFirstPain extends CustomPainter {
  Paint _colPaint;

  @override
  void paint(Canvas canvas, Size size) {
    _colPaint = Paint()
      ..color = Colors.blueAccent
    ..style = PaintingStyle.fill
    ..strokeWidth = 5.0;
    print(size.width);
    print(size.height);

    canvas.drawLine(Offset(0, 0), Offset(size.width, size.height), _colPaint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return false;
  }


}
