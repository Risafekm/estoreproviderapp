import 'package:estoreproviderapp/Model/gridCardItem.dart';
import 'package:flutter/material.dart';

class ProviderCart extends ChangeNotifier {
  int _countValue = 0;

  final List<GridCardItem> _items = [
    GridCardItem(
      images:
          'https://rukminim1.flixcart.com/image/750/900/l0y6qa80/dress/v/a/s/xl-western-dress-512-purvaja-original-imagcmcfzs328pjt.jpeg?q=70',
      itemName: 'Women A-line Light Blue Dress',
      itemPrice: '₹469',
      itemmainPrice: '₹1250',
      itemStar: '3.9',
      count: 0,
    ),
    GridCardItem(
      images:
          'https://www.dukeindia.com/cdn/shop/products/1_bf03c2bd-cbb5-4042-8c66-9ab5ba2fe16d_1024x1024.jpg?v=1667643585',
      itemName: 'Men Slim Fit Solid Spread Collar Casual Shirt',
      itemPrice: '₹449',
      itemmainPrice: '₹990',
      itemStar: '3.9',
      count: 1,
    ),
    GridCardItem(
      images:
          'https://assets.ajio.com/medias/sys_master/root/20210404/36Ky/606a5a4ff997dd7b6483537c/-473Wx593H-461635769-blue-MODEL.jpg',
      itemName: 'Women Maxi Blue Dress',
      itemPrice: '₹474',
      itemmainPrice: '₹1450',
      itemStar: '4.0',
      count: 2,
    ),
    GridCardItem(
      images:
          'https://www.trigger.in/cdn/shop/products/0W2A7472.jpg?v=1682760910',
      itemName: 'Men Slim Fit Checkered Casual Shirt',
      itemPrice: '₹413',
      itemmainPrice: '₹1040',
      itemStar: '4.0',
      count: 3,
    ),
    GridCardItem(
      images:
          'https://images.meesho.com/images/products/222747334/bsddv_512.webp',
      itemName: 'Men Regular Fit Printed Casual Shirt',
      itemPrice: '₹760',
      itemmainPrice: '₹850',
      itemStar: '4.6',
      count: 4,
    ),
    GridCardItem(
      images: 'https://m.media-amazon.com/images/I/31u5qnHW4RL.jpg',
      itemName: 'Women Ethnic Dress Multicolor Dress',
      itemPrice: '₹581',
      itemmainPrice: '₹1050',
      itemStar: '4.2',
      count: 5,
    ),
  ];

  List<GridCardItem> _cartItems = [];

  int _itemCount = 0;
  int _cartItemsCount = 0;

  void addCount() {
    if (_countValue == 0 || _countValue > 0) {
      _countValue++;
      notifyListeners();
    }
  }

  void subCount() {
    if (_countValue > 0) {
      _countValue--;
      notifyListeners();
    }
  }

  void addTocart(GridCardItem item) {
    if (_cartItems.contains(item)) {
      _cartItems[_cartItems.indexOf(item)].count++;
    } else {
      _cartItems.add(item);
      _cartItems[_cartItems.indexOf(item)].count = 1;
      _items[_items.indexOf(item)].count = 1;
    }
    _cartItemsCount++;
    notifyListeners();
  }

  void removeFromcart(GridCardItem item) {
    if (_cartItems.contains(item) &&
        _cartItems[_cartItems.indexOf(item)].count == 1) {
      _items[_items.indexOf(item)].count = 0;
      _cartItems.remove(_cartItems[_cartItems.indexOf(item)]);
      _cartItemsCount--;
    } else if (_cartItems[_cartItems.indexOf(item)].count > 0) {
      _cartItems[_cartItems.indexOf(item)].count--;
      _cartItemsCount--;
    }
    notifyListeners();
  }

  //get

  int get count => _countValue;

  List<GridCardItem> get items => _items;
  List<GridCardItem> get cartItems => _cartItems;
  int get itemsCount => _items.length;
  int get cartItemsCount => _cartItems.length;
}
