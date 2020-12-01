// import 'dart:ui' as ui;
//
// import 'package:flutter/cupertino.dart';
// class GPCustomPainter extends CustomPainter{
//
//   @override
//   void paint(Canvas canvas, Size size) {
//
//
//
//     Paint paint_0 = new Paint()
//       ..color = Color.fromARGB(255, 33, 150, 243)
//       ..style = PaintingStyle.stroke
//       ..strokeWidth = 1;
//
//
//     Path path_0 = Path();
//     path_0.moveTo(size.width*0.39,size.height*3.05);
//
//     canvas.drawPath(path_0, paint_0);
//
//
//     Paint paint_1 = new Paint()
//       ..color = Color.fromARGB(255, 255, 255, 255)
//       ..style = PaintingStyle.fill
//       ..strokeWidth = 1;
//
//
//     Path path_1 = Path();
//     path_1.moveTo(size.width*0.38,size.height*0.20);
//     path_1.quadraticBezierTo(size.width*0.37,size.height*0.14,size.width*0.45,size.height*0.15);
//     path_1.quadraticBezierTo(size.width*0.56,size.height*0.16,size.width*0.60,size.height*0.15);
//     path_1.quadraticBezierTo(size.width*0.63,size.height*0.15,size.width*0.63,size.height*0.25);
//     path_1.lineTo(size.width,size.height);
//     path_1.lineTo(size.width*0.50,size.height);
//     path_1.lineTo(0,size.height);
//     path_1.quadraticBezierTo(size.width*0.37,size.height*0.45,size.width*0.38,size.height*0.20);
//     path_1.close();
//
//     canvas.drawPath(path_1, paint_1);
//
//
//   }
//
//   @override
//   bool shouldRepaint(covariant CustomPainter oldDelegate) {
//     return true;
//   }
//
// }
