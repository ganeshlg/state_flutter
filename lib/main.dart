import 'package:flutter/material.dart';
import 'package:state/car_state_provider.dart';
import 'package:state/widgets/acceleration_widget.dart';
import 'package:state/widgets/brake_widget.dart';
import 'package:state/widgets/steering_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Car(),
    );
  }
}

class Car extends StatefulWidget {
  const Car({super.key});

  @override
  State<Car> createState() => _CarState();
}

class _CarState extends State<Car> {
  late String _carState = "PARKED";
  late int _selectedIndex = 0;

  final List<Widget> _childWidgets = <Widget>[
    const Acceleration(),
    const Steering(),
    const Brake(),
  ];

  void _changeCarState(String state) {
    setState(() {
      _carState = state;
    });
  }

  void _reset(){
    setState(() {
      _carState = "PARKED";
      _selectedIndex = 0;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("CAR"),
      ),
      body: Center(
          child: CarStateProvider(
              carState: _carState,
              changeCarState: _changeCarState,
              child: _childWidgets.elementAt(_selectedIndex))),
      bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: const Icon(Icons.fast_forward_outlined),
                label: 'Acceleration',
                backgroundColor: Theme.of(context).colorScheme.inversePrimary),
            BottomNavigationBarItem(
                icon: const Icon(Icons.threed_rotation),
                label: 'Steering',
                backgroundColor: Theme.of(context).colorScheme.inversePrimary),
            BottomNavigationBarItem(
                icon: const Icon(Icons.stop_circle_outlined),
                label: 'Brake',
                backgroundColor: Theme.of(context).colorScheme.inversePrimary),
          ],
          type: BottomNavigationBarType.shifting,
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          onTap: _onItemTapped,
          elevation: 5), //
      floatingActionButton: FloatingActionButton(
        onPressed: _reset,
        child: const Text("RESET"),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
