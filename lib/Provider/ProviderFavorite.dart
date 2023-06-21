import 'package:estoreproviderapp/Model/gridCardItem.dart';
import 'package:flutter/material.dart';

class ProviderFavorite extends ChangeNotifier {
  final List<GridCardItem> _items = [
    GridCardItem(
      images: 'assets/fasion/w1.png',
      itemName: 'woman wearing black shirt smiling',
      itemPrice: '₹469',
      itemmainPrice: '₹1250',
      itemStar: '3.9',
      count: 0,
    ),
    GridCardItem(
      images: 'assets/fasion/3.png',
      itemName: 'Jorge Blanco Elen, man wearing blue denim jacket',
      itemPrice: '₹449',
      itemmainPrice: '₹990',
      itemStar: '3.9',
      count: 1,
    ),
    GridCardItem(
      images: 'assets/fasion/w2.png',
      itemName:
          'woman wearing blue shirt and black bottoms,Victoria Justice Smiling',
      itemPrice: '₹474',
      itemmainPrice: '₹1450',
      itemStar: '4.0',
      count: 2,
    ),
    GridCardItem(
      images: 'assets/fasion/2.png',
      itemName: 'Men wearing Slim Fit blue denim jacket ',
      itemPrice: '₹413',
      itemmainPrice: '₹1040',
      itemStar: '4.0',
      count: 3,
    ),
    GridCardItem(
      images: 'assets/fasion/1.png',
      itemName: 'Men Regular Fit blue denim jacket',
      itemPrice: '₹760',
      itemmainPrice: '₹850',
      itemStar: '4.6',
      count: 4,
    ),
    GridCardItem(
      images: 'assets/fasion/w3.png',
      itemName: 'Sophia Tolli Wedding dress Bridesmaid dress Clothing',
      itemPrice: '₹581',
      itemmainPrice: '₹1050',
      itemStar: '4.2',
      count: 5,
    ),
  ];

  List<GridCardItem> _cartItems = [];

  int _itemCount = 0;
  int _cartItemsCount = 0;

  void addTOfavorite(GridCardItem item) {
    _cartItems.add(item);
    notifyListeners();
  }

  void removeFromfavorite(GridCardItem item) {
    _cartItems.remove(item);
    notifyListeners();
  }

  //get

  List<GridCardItem> get items => _items;
  List<GridCardItem> get cartItems => _cartItems;
  int get itemsCount => _items.length;
  int get cartItemsCount => _cartItems.length;
}
