import 'package:flutter/material.dart';

class Barcode extends StatelessWidget {
  const Barcode({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Text(
          'barcode',
        ),
      ),
    );
  }
}
