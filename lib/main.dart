import 'package:flutter/material.dart';
import 'package:recorte/circular_cofee.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'CustomClipper',
      home: TestCustomClipler(),
    );
  }
}

class TestCustomClipler extends StatefulWidget {
  const TestCustomClipler({
    super.key,
  });

  @override
  State<TestCustomClipler> createState() => _TestCustomCliplerState();
}

class _TestCustomCliplerState extends State<TestCustomClipler> {
  double page = 0.0;
  final pageController = PageController();
  @override
  void initState() {
    pageController.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    pageController.removeListener(_listener);
    pageController.dispose();

    super.dispose();
  }

  void _listener() {
    setState(() {
      page = pageController.page ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/fondo1.jpeg'), fit: BoxFit.cover),
        ),
        child: Placeholder(
          child: SizedBox(
            height: 300,
            width: 300,
            child: PageView.builder(
              scrollDirection: Axis.horizontal,
              controller: pageController,
              itemCount: 8,
              clipBehavior: Clip.none,
              itemBuilder: (BuildContext context, int index) {
                double porcentaje = (page - index).abs();
                return Transform.scale(
                  alignment: Alignment.bottomCenter,
                  scale: 0.5 + (0.5 - 0.5 * porcentaje),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Center(child: CircularCofee()),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
