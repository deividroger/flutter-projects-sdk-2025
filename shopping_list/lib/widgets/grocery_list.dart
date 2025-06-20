import 'package:flutter/material.dart';

import 'package:shopping_list/models/grocery_item.dart';
import 'package:shopping_list/widgets/new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> groceryItems = [];
  void _addItem() async {
    var result = await Navigator.of(
      context,
    ).push<GroceryItem>(MaterialPageRoute(builder: (ctx) => const NewItem()));

    setState(() {
      groceryItems.add(result!);
    });
  }

  void _removeItem(GroceryItem item) {
    setState(() {
      groceryItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Groceries'),
        actions: [IconButton(onPressed: _addItem, icon: const Icon(Icons.add))],
      ),
      body:
          groceryItems.isNotEmpty
              ? ListView.builder(
                itemCount: groceryItems.length,
                itemBuilder:
                    (ctx, index) => Dismissible(
                      key: ValueKey(groceryItems[index].id),
                      onDismissed: (direction) {
                        _removeItem(groceryItems[index]);
                      },
                      child: ListTile(
                        title: Text(groceryItems[index].name),
                        leading: Container(
                          width: 24,
                          height: 24,
                          color: groceryItems[index].category.color,
                        ),
                        trailing: Text(groceryItems[index].quantity.toString()),
                      ),
                    ),
              )
              : Center(
                child: const Text(
                  'No items added yet.',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
    );
  }
}
