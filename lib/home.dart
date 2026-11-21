import 'package:flutter/material.dart';
import 'item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width * 0.6;
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      itemWidth = MediaQuery.of(context).size.width * 0.3;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu')
      ),
      body: ShowItems(itemWidth: itemWidth)
    );
  }
}
