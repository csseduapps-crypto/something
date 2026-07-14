import 'package:flutter/material.dart';
import 'package:flutter_app/screens/root_layout.dart';

void main() {
  runApp(const DriveMax());
}

class DriveMax extends StatelessWidget {
  const DriveMax({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: RootLayout());
  }
}
