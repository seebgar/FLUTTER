import 'package:flutter/material.dart';
import 'package:shop_app/models/product.dart';

// ** change notifier is related to inherited widget -> comunication between widgets
class Products with ChangeNotifier {
  List<Product> _items = [
    new Product(
      id: "p1",
      title: "Producto 1",
      description: "One description of a product.",
      imageUrl:
          "https://images.pexels.com/photos/5956/gift-brown-shopping-market.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260",
    ),
    new Product(
      id: "p2",
      title: "Producto 2",
      description: "Una descripcion",
      imageUrl:
          "https://images.pexels.com/photos/6044288/pexels-photo-6044288.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
    ),
  ]; // changes over time

// ** all objects are reference types as JAVASCRIPT
  List<Product> get items {
    return [..._items];
  }

  void addProduct(Product value) {
    _items.add(value);
    notifyListeners(); // ** update objects to listeners to this class
  }

  Product findById(String id) {
    return _items.firstWhere((element) => element.id == id);
  }
}
