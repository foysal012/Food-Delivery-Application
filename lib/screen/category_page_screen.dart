import 'package:flutter/material.dart';

class CategoryPageScreen extends StatefulWidget {
  const CategoryPageScreen({Key? key}) : super(key: key);

  @override
  State<CategoryPageScreen> createState() => _CategoryPageScreenState();
}

class _CategoryPageScreenState extends State<CategoryPageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          color: Colors.pink,
        ),
    );
  }
}
