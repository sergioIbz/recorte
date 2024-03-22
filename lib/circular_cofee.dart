import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:recorte/circular_cut.dart';

class CircularCofee extends StatelessWidget {
  final String background;
  final String cofee;
  const CircularCofee({
    super.key,
    required this.background,
    required this.cofee,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 450,
      width: 450,
      child: ClipPath(
        clipper: CircularCut(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              width: 450, // Ancho del contenedor
              height: 450, // Altura del contenedor
              decoration: BoxDecoration(
                color: const Color(0xffF3DA57),
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(background),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: -35,
              child: TweenAnimationBuilder<double>(
                curve: Curves.bounceOut,
                duration: const Duration(
                  milliseconds: 2000,
                ),
                tween: Tween(begin: 1.0, end: 0.0),
                child: Image.asset(
                  cofee,
                  fit: BoxFit.cover,
                  height: 590,
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
