import 'package:flutter/cupertino.dart';

class CarStateProvider extends InheritedWidget {
  final String carState;
  final Function changeCarState;

  const CarStateProvider(
      {super.key,
      required super.child,
      required this.carState,
      required this.changeCarState});

  @override
  bool updateShouldNotify(CarStateProvider oldWidget) {
    return oldWidget.carState != carState;
  }

  static CarStateProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<CarStateProvider>();
  }
}
