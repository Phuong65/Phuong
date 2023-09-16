import 'package:flutter/material.dart';
class Secondroute extends StatefulWidget {
  const Secondroute({super.key});

  @override
  State<Secondroute> createState() => _SecondrouteState();
}

class _SecondrouteState extends State<Secondroute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Secondroute'),
      ),
    );
  }
}
