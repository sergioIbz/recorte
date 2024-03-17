import 'package:flutter/material.dart';
import 'package:recorte/circular_cut.dart';

class CircularCofee extends StatelessWidget {
  const CircularCofee({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 300,
      child: ClipPath(
        clipper: CircularCut(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 300, // Ancho del contenedor
              height: 300, // Altura del contenedor
              decoration: const BoxDecoration(
                color: Color(0xffF3DA57),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/fondo1.png'),
                ),
              ),
            ),
            Positioned(
              bottom: -25,
              child: TweenAnimationBuilder<double>(
                curve: Curves.bounceOut,
                duration: const Duration(
                  milliseconds: 1500,
                ),
                tween: Tween(begin: 1.0, end: 0.0),
                child: Image.asset(
                  'assets/1.png',
                  fit: BoxFit.cover,
                  height: 430,
                ),
                builder: (BuildContext context, double value, Widget? child) {
                  return Transform.translate(
                    offset: Offset(0, 300 * value),
                    child: child!,
                  );
                },
              ),
            ),
            // CustomPaint(
            //   size: Size(300, 300),
            //   painter: MyPaint(),
            // )
          ],
        ),
      ),
    );
  }
}