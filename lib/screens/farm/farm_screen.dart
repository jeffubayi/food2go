import 'package:flutter/material.dart';

class FarmScreen extends StatelessWidget {
  const FarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Farms'),
      ),
      body: const Center(
        child: Text('Farm Management Screen'),
      ),
    );
  }
}
