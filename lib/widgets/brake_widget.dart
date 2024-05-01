import 'package:flutter/material.dart';
import '../car_state_provider.dart';

class Brake extends StatefulWidget {
  const Brake({super.key});

  @override
  State<Brake> createState() => _BrakeState();
}

class _BrakeState extends State<Brake> {
  late String _brakeState = "BRAKE NOT APPLIED";

  void changeAccelerationState() {
    setState(() {
      _brakeState = "BRAKE APPLIED";
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
        const Text("Brake State (Ephemeral State)"),
        Text(_brakeState),
        ElevatedButton(onPressed: () {
          carStateProvider?.changeCarState.call("STOPPED");
          changeAccelerationState();
        }, child: const Text("Apply Brake")),
      ],
    );
  }

}