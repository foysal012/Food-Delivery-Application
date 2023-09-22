import 'package:flutter/material.dart';

class MessagingPageScreen extends StatefulWidget {
  const MessagingPageScreen({Key? key}) : super(key: key);

  @override
  State<MessagingPageScreen> createState() => _MessagingPageScreenState();
}

class _MessagingPageScreenState extends State<MessagingPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blue,
      ),
    );
  }
}
