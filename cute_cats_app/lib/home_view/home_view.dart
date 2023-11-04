import 'dart:math';

import 'package:cute_cats_app/home_view/widgets/body_widget.dart';
import 'package:cute_cats_app/home_view/widgets/floatingActionButton_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Random random = Random();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cats App', style: TextStyle(fontSize: 30)),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[Colors.black, Colors.purpleAccent])),
        ),
      ),
      body: bodyWidget(random: random),
      floatingActionButton: const floatingActionButton(),
    );
  }
}



