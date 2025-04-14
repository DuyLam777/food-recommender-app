import 'package:flutter/material.dart';
import 'package:fitness/domain/fridge.dart';
import 'package:fitness/domain/ingredient.dart';

class FridgePage extends StatefulWidget {
  @override
  _FridgePageState createState() => _FridgePageState();
}

class _FridgePageState extends State<FridgePage> {
  // Initialize fridge and ingredients
  Fridge _myFridge = Fridge();
  List<Ingredient> _ingredients = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Fridge'), centerTitle: true),
      body:
          _myFridge.ingredients.isEmpty
              ? Center(child: Text('Your fridge is empty!'))
              : ListView.builder(
                itemCount: _myFridge.ingredients.length,
                itemBuilder: (context, index) {
                  final ingredient = _myFridge.ingredients[index];
                  return Card(
                    margin: EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ingredient.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                            ),
                          ),
                          if (ingredient.category != null)
                            Text('Category: ${ingredient.category}'),
                          if (ingredient.quantity != null)
                            Text('Quantity: ${ingredient.quantity}'),
                          if (ingredient.expiryDate != null)
                            Text(
                              'Expires on: ${ingredient.expiryDate!.toLocal().toString().split(' ')[0]}',
                            ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      // Add a new ingredient using the domain model
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _myFridge.addIngredient(
              Ingredient(
                name: 'Cheese',
                category: 'Dairy',
                quantity: 200,
                expiryDate: DateTime.now().add(Duration(days: 7)),
              ),
            );
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
