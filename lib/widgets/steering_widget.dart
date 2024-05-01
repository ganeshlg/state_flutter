import 'package:flutter/material.dart';
import '../car_state_provider.dart';

class Steering extends StatefulWidget {
  const Steering({super.key});

  @override
  State<Steering> createState() => _SteeringState();
}

class _SteeringState extends State<Steering> {
  late String steeringState = "NOT TURNED";

  void changeSteeringState(String state) {
    setState(() {
      steeringState = state;
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
        const Text("Steering State (Ephemeral State)"),
        Text(steeringState),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(onPressed: (){
              carStateProvider?.changeCarState.call("TURNED");
              changeSteeringState("TURNED LEFT");
            }, icon: const Icon(Icons.arrow_circle_left_outlined)),
            IconButton(onPressed: (){
              carStateProvider?.changeCarState.call("TURNED");
              changeSteeringState("TURNED RIGHT");
            }, icon: const Icon(Icons.arrow_circle_right_outlined))
          ],
        ),
      ],
    );
  }

}