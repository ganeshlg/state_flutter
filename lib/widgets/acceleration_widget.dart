import 'package:flutter/material.dart';
import '../car_state_provider.dart';

class Acceleration extends StatefulWidget {
  const Acceleration({super.key});

  @override
  State<Acceleration> createState() => _AccelerationState();
}

class _AccelerationState extends State<Acceleration> {
  late String _accelerationState = "ACCELERATION NOT APPLIED";

  void changeAccelerationState() {
    setState(() {
      _accelerationState = "ACCELERATION APPLIED";
    });
  }

  @override
  Widget build(BuildContext context) {

    final carStateProvider = CarStateProvider.of(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("Car State (App State)"),
        Text(carStateProvider?.carState??""),
        const SizedBox(height: 50,),
        const Text("Acceleration State (Ephemeral State)"),
        Text(_accelerationState),
        ElevatedButton(onPressed: () {
          carStateProvider?.changeCarState.call("MOVING");
          changeAccelerationState();
        }, child: const Text("Accelerate")),
      ],
    );
  }

}