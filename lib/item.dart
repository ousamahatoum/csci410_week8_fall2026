import 'package:flutter/material.dart';

class Item {
  String name;
  double price;
  String image;
  bool selected = false;

  Item(this.name, this.price, this.image);
}

List<Item> _items = [
  Item('Burger', 7, 'https://images.unsplash.com/photo-1568901346375-23c9450c58cd?q=80&w=999&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D'),
  Item('Pizza', 10, 'https://images.unsplash.com/photo-1513104890138-7c749659a591?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D'),
  Item('Salad', 6, 'https://images.unsplash.com/photo-1607532941433-304659e8198a?q=80&w=1078&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D'),
  Item('Fresh Juice', 5, 'https://images.unsplash.com/photo-1603569283847-aa295f0d016a?q=80&w=1072&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=NHwxMjA3fDA%3D'),
];

void resetItems() {
  _items.forEach((item) => item.selected = false);
}

class ShowItems extends StatelessWidget {
  final double itemWidth;
  final Function(Item, bool) addItem;
  const ShowItems({required this.addItem, required this.itemWidth, super.key});

  @override
  Widget build(BuildContext context) {
    final TextStyle itemText = TextStyle(fontSize: itemWidth * 0.1);
    return ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Padding(padding: EdgeInsets.all(itemWidth * 0.01), child: Align(alignment: Alignment.topCenter,
              child: Container(width: itemWidth, color: index % 2 == 0 ? Colors.grey.shade200 : Colors.grey.shade300,
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Name: ${_items[index].name}', style: itemText),
                  Text('Price: \$${_items[index].price}', style: itemText),
                  Image.network(_items[index].image),
                  Center(child: Checkbox(value: _items[index].selected, onChanged: (value) => addItem(_items[index], value as bool)))
          ]
          ))));
        }
    );
  }
}


