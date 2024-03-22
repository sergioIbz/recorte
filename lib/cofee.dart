class Coffee {
  final String background;
  final String cofee;
  final String nameCofee;
  Coffee({
    required this.background,
    required this.cofee,
    required this.nameCofee,
  });
}

List<Coffee> coffeeList = [
  Coffee(
    background: 'assets/background/f1.png',
    cofee: 'assets/coffee/2.png',
    nameCofee: 'Caramel Latte',
  ),
  Coffee(
    background: 'assets/background/f2.png',
    cofee: 'assets/coffee/1.png',
    nameCofee: 'Caramel Frappuccino',
  ),
  Coffee(
    background: 'assets/background/f3.png',
    cofee: 'assets/coffee/2.png',
    nameCofee: 'Caramel Latte',
  ),
  Coffee(
    background: 'assets/background/f4.png',
    cofee: 'assets/coffee/3.png',
    nameCofee: 'Midnight Frappuccino',
  ),
];
