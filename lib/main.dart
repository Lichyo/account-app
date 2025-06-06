import 'package:account_app/view/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(AccountApp());
class AccountApp extends StatelessWidget {
  const AccountApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: HomePage()
    );
  }
}
