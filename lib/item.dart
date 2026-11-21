import 'package:flutter/material.dart';

class Item {
  String name;
  double price;

  Item(this.name, this.price);
}

List<Item> items = [
  Item('Burger', 7),
  Item('Pizza', 10),
  Item('Salad', 6),
  Item('Fresh Juice', 5),
];

class ShowItems extends StatelessWidget {
  final double itemWidth;
  ShowItems({required this.itemWidth, super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle itemText = TextStyle(fontSize: itemWidth * 0.1);
    return ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Align(alignment: Alignment.topCenter,
              child: Container(width: itemWidth, color: index % 2 == 0 ? Colors.grey.shade100 : Colors.grey.shade300,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text('Name: ${items[index].name}', style: itemText),
            Text('Price: \$${items[index].price}', style: itemText),
          ]
          )));
        }
    );
  }
}


