import 'package:flutter/material.dart';

void main() {
  runApp(const CredPalApp());
}

class CredPalApp extends StatelessWidget {
  const CredPalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CredPal UI Test',
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: Center(child: Text('Hello CredPal!'))),
    );
  }
}
