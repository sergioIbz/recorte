import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CustomClipper',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('CustomClipper'),
        ),
        body: Center(
          child: ClipPath(
            clipper: PruebaClipper(),
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  width: 300, // Ancho del contenedor
                  height: 400, // Altura del contenedor
                  decoration: const BoxDecoration(
                    color: Colors.amberAccent,
                    shape: BoxShape.circle,
                  ),
                ),
                Positioned(
                  bottom: -60,
                  child: Image.network(
                    'https://www.calfruitos.com/fotos/pr_8957_20230724145623.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4.0;

    final halfWidth = size.width / 2;

    // Dibujar línea hacia abajo hasta la mitad izquierda
    final path = Path()
      ..arcTo(
        Rect.fromCircle(
          center: Offset(halfWidth, size.height / 2),
          radius: halfWidth,
        ),
        pi, // Angulo inicial (180 grados)
        -pi, // Angulo de barrido (-180 grados, para formar la mitad del círculo hacia abajo)
        false, // No usar el radio del círculo como ancho de línea
      );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

//!-----------------------------------------------------------------------------
//!-----------------------------------------------------------------------------
//!-----------------------------------------------------------------------------

class PruebaClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
   
    final halfWidth = size.width / 2;
    Path path = Path()
      ..lineTo(0, 0)
      ..arcTo(
        Rect.fromCircle(
          center: Offset(halfWidth, size.height / 2),
          radius: halfWidth,
        ),
        pi, 
        -pi, 
        false, 
      )
      ..lineTo(size.width, 0.0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
