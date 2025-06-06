import 'package:flutter/material.dart';
import 'view/input_page.dart';

void main() {
  runApp(AccountApp());
}

class AccountApp extends StatelessWidget {
  const AccountApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: InputPage());
  }
}
