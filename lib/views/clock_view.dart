import 'dart:math';
import 'package:flutter/material.dart';

class ClockView extends StatefulWidget {
  const ClockView({Key? key, required this.size}) : super(key: key);
  final double size;
  @override
  State<ClockView> createState() => _ClockViewState();
}

class _ClockViewState extends State<ClockView> {

  @override
  void initState() {
  /*  Timer.periodic(Duration(seconds: 1), (timer) { setState(() {
    });});*/
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: Transform.rotate(
        angle: -pi/2,
        child: CustomPaint(
          painter: ClockPainter(),
        ),
      ),
    );
  }
}

class ClockPainter extends CustomPainter{
  var dateTime = DateTime.now();

  // 60 sec -360, i sec - 6 degree

  @override
  void paint(Canvas canvas, Size size) {
    // size >> size of the canvas
    // canvas >> you can draw with
    var centerX = size.width /2;
    var centerY = size.height /2;
    var center = Offset(centerX, centerY); // now we have the center point

    var radius = min(centerX, centerY);

    var fillBrush = Paint() //  customise the brush color and other styles
    ..color = Color(0xff444974);
 var outlineBrush = Paint() //  customise the brush color and other styles
    ..color = Color(0xffeaecff)
    ..style = PaintingStyle.stroke
    ..strokeWidth=16;

  var centerFillBrush = Paint() //  customise the brush color and other styles
    ..color = Color(0xffeaecff);

  var secHandBrush = Paint()
    ..color = Colors.orange[300]!
    ..style = PaintingStyle.stroke
    ..strokeCap=StrokeCap.round
    ..strokeWidth=8;

  var minHandBrush = Paint()
    ..shader = RadialGradient(colors: [Color(0xff748ef6),Color(0xff77ddff)]).createShader(Rect.fromCircle(center: center, radius: radius))
    ..style = PaintingStyle.stroke
    ..strokeCap=StrokeCap.round
    ..strokeWidth=12;

  var hourHandBrush = Paint()
    ..shader = RadialGradient(colors: [Color(0xffea74ab),Color(0xffc279fb)]).createShader(Rect.fromCircle(center: center, radius: radius))
    ..style = PaintingStyle.stroke
    ..strokeCap=StrokeCap.round
    ..strokeWidth=16;

    var dashBrush = Paint()
      ..color = Colors.grey
      ..style = PaintingStyle.stroke
      ..strokeCap=StrokeCap.round
      ..strokeWidth=3;
    canvas.drawCircle(center, radius-40, fillBrush);
    canvas.drawCircle(center, radius-40, outlineBrush);


    var secHandX = centerX +80*  cos(dateTime.second*6*pi/180);
    var secHandy = centerX +80*  sin(dateTime.second*6*pi/180);
    canvas.drawLine(center,Offset(secHandX, secHandy),secHandBrush);

    var minHandX = centerX +80*  cos(dateTime.minute*6*pi/180);
    var minHandy = centerX +80*  sin(dateTime.minute*6*pi/180);
    canvas.drawLine(center,Offset(minHandX, minHandy),minHandBrush);

    var hourHandX = centerX +80*  cos((dateTime.hour*30 +dateTime.minute * 0.5 )*pi/180);
    var hourHandy = centerX +80*  sin((dateTime.hour*30 +dateTime.minute * 0.5 )*pi/180);
    canvas.drawLine(center,Offset(hourHandX, hourHandy),hourHandBrush);

    canvas.drawCircle(center, 16, centerFillBrush);

    var outerCircleRadius = radius;
    var innerCircleRadius = radius -14;
    for(double i = 0;i < 360;i +=12){
      var x1 = centerX + outerCircleRadius * cos(i*pi/180);
      var y1 = centerX + outerCircleRadius * sin(i*pi/180);

      var x2 = centerX + innerCircleRadius * cos(i*pi/180);
      var y2 = centerX + innerCircleRadius * sin(i*pi/180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
