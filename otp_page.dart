import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PerDigitGreenPin extends StatefulWidget {
  const PerDigitGreenPin({super.key});

  @override
  State<PerDigitGreenPin> createState() => _PerDigitGreenPinState();
}

class _PerDigitGreenPinState extends State<PerDigitGreenPin> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {}); // Update UI when value changes
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Green Digits')),
      body: Center(
        child: Pinput(
          controller: _controller,
          length: 4,
          defaultPinTheme: PinTheme(
            width: 60,
            height: 60,
            textStyle: TextStyle(fontSize: 22, color: Colors.black),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
          ),
          focusedPinTheme: PinTheme(
            width: 60,
            height: 60,
            textStyle: TextStyle(fontSize: 22, color: Colors.green[800]),
            decoration: BoxDecoration(
              color: Colors.green[100],
              border: Border.all(color: Colors.green, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          submittedPinTheme: PinTheme(
            width: 60,
            height: 60,
            textStyle: TextStyle(fontSize: 22, color: Colors.black),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
