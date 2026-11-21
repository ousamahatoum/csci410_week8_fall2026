import 'package:flutter/material.dart';
import 'item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double total = 0;

  void addItem(Item item, bool selected) {
   setState(() {
     item.selected = selected;
     if (selected) {
       total += item.price;
     }
     else {
       total -= item.price;
     }
   });
  }
  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width * 0.6;
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      itemWidth = MediaQuery.of(context).size.width * 0.3;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Total \$$total'),
        actions: [
          IconButton(onPressed: () => setState(() {
            resetItems();
            total = 0;
          }), icon: Icon(Icons.restore))
        ],
      ),
      body: ShowItems(addItem: addItem, itemWidth: itemWidth)
    );
  }
}
