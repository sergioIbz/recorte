import 'package:flutter/material.dart';

import 'package:recorte/circular_cofee.dart';
import 'package:recorte/cofee.dart';

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
    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          CustomPageCoffee(
              size: size, pageController: pageController, page: page),
          Positioned(
            bottom: 180,
            child: AnimatedSwitcher(
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              duration: const Duration(milliseconds: 200),
              child: Container(
                key: ValueKey<int>(page.toInt() % coffeeList.length),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: const Color(0xff5CA3A8),
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  coffeeList[page.toInt() % coffeeList.length].nameCofee,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomPageCoffee extends StatelessWidget {
  const CustomPageCoffee({
    super.key,
    required this.size,
    required this.pageController,
    required this.page,
  });

  final Size size;
  final PageController pageController;
  final double page;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height,
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/background/b.jpeg'), fit: BoxFit.cover),
      ),
      child: SizedBox(
        height: 300,
        width: 300,
        child: PageView.builder(
          scrollDirection: Axis.horizontal,
          controller: pageController,
          //itemCount: coffeeList.length,
          clipBehavior: Clip.none,
          itemBuilder: (BuildContext context, int index) {
            double porcentaje = (page - index).abs();

            return Transform.scale(
              alignment: Alignment.bottomCenter,
              scale: 0.1 + (0.9 - 0.9 * porcentaje),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Center(
                  child: CircularCofee(
                    background:
                        coffeeList[index % coffeeList.length].background,
                    cofee: coffeeList[index % coffeeList.length].cofee,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
