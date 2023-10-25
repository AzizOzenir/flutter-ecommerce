import 'package:commerce/Services/ApiService.dart';
import 'package:flutter/material.dart';

class Controllers extends ChangeNotifier {
 
 bool isRegister = false;
 
setRegister(){
  isRegister = !isRegister;
  notifyListeners();
}

  List data = [];

  List categories = [
    "All",
    "electronics",
    "jewelery",
    "men's clothing",
    "women's clothing",
  ];

  List<Color> colors = [
    const Color.fromARGB(255, 0, 225, 255),
    const Color.fromARGB(255, 0, 255, 8),
    Colors.red,
    Colors.grey,
    Colors.black
  ];

  List<int> productsInBasket = [];

  addToBasket(int id) {
    productsInBasket.add(id);
    notifyListeners();
  }

  int SelectedColor = 0;

  String ActiveCategorie = "All";

  setSelectedColor(int index) {
    SelectedColor = index;
    notifyListeners();
  }

  setActiveChip(String categorie) async {
    ActiveCategorie = categorie;
    notifyListeners();
    final response = await ApiService().getHttp(ActiveCategorie);
    setData(response);
  }

  setData(response) {
    data = response;
    notifyListeners();
  }
}
