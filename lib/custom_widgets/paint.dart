import 'package:flutter/cupertino.dart';

class RPSCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint_0 = new Paint()
      ..color = Color.fromARGB(255, 46, 208, 166)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_0 = Path();
    path_0.quadraticBezierTo(size.width * 0.9289259, size.height * 0.3538000,
        size.width * 0.9937130, size.height * 0.2026500);
    path_0.quadraticBezierTo(size.width * 0.9935278, size.height * 0.2492833,
        size.width * 0.9930093, size.height * 0.3803167);
    path_0.lineTo(size.width * 0.5879630, size.height * 0.3860667);
    path_0.close();

    canvas.drawPath(path_0, paint_0);

    Paint paint_1 = new Paint()
      ..color = Color.fromARGB(113, 60, 84, 232)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_1 = Path();
    path_1.moveTo(size.width * 0.4066204, size.height * -0.0801000);
    path_1.quadraticBezierTo(size.width * 0.2977315, size.height * 0.1628333,
        size.width * -0.0387593, size.height * 0.1655333);
    path_1.quadraticBezierTo(size.width * 0.0587315, size.height * 0.2270667,
        size.width * 0.3502500, size.height * 0.3999833);
    path_1.lineTo(size.width * 0.4066204, size.height * -0.0801000);
    path_1.close();

    canvas.drawPath(path_1, paint_1);

    Paint paint_2 = new Paint()
      ..color = Color.fromARGB(93, 113, 211, 188)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1.0;

    Path path_2 = Path();
    path_2.moveTo(size.width * 0.33, size.height * -0.0053833);
    path_2.lineTo(size.width * 0.8422870, size.height * -0.0010667);
    path_2.quadraticBezierTo(size.width * 0.8991667, size.height * 0.3594667,
        size.width * 0.9862685, size.height * 0.4773000);
    path_2.quadraticBezierTo(size.width * 0.9353148, size.height * 0.1509333,
        size.width * 0.9947407, size.height * -0.0053833);
    path_2.close();

    canvas.drawPath(path_2, paint_2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
