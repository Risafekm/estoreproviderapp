import 'package:estoreproviderapp/Provider/ProviderBottomNavigation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'BottomNavignItems.dart';

class BottomNavigationBAR extends StatelessWidget {
  const BottomNavigationBAR({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var pageValue = context.watch<ProviderBottomNavigation>();

    return Consumer<ProviderBottomNavigation>(
      builder: (BuildContext context, pages, Widget? child) {
        return SafeArea(
          child: Container(
            height: 70,
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavignItems(
                  ontap: () {
                    pages.pageChange = 0;
                  },
                  icon: pages.pageIndex == 0 ? Icons.home : Icons.home_outlined,
                  size: pages.pageIndex == 0 ? 26 : 22,
                  color: pages.pageIndex == 0
                      ? Colors.lightBlueAccent
                      : Colors.white,
                  text: 'Home',
                ),
                BottomNavignItems(
                  ontap: () {
                    pages.pageChange = 1;
                  },
                  icon: pages.pageIndex == 1
                      ? Icons.shopping_bag
                      : Icons.shopping_bag_outlined,
                  size: pages.pageIndex == 1 ? 26 : 22,
                  color: pages.pageIndex == 1
                      ? Colors.lightBlueAccent
                      : Colors.white,
                  text: 'Brand',
                ),
                BottomNavignItems(
                  ontap: () {
                    pages.pageChange = 2;
                  },
                  icon: pages.pageIndex == 2
                      ? Icons.shopping_cart
                      : Icons.shopping_cart_outlined,
                  size: pages.pageIndex == 2 ? 26 : 22,
                  color: pages.pageIndex == 2
                      ? Colors.lightBlueAccent
                      : Colors.white,
                  text: 'Cart',
                ),
                BottomNavignItems(
                  ontap: () {
                    pages.pageChange = 3;
                  },
                  icon: pages.pageIndex == 3
                      ? Icons.person
                      : Icons.person_2_outlined,
                  size: pages.pageIndex == 3 ? 26 : 22,
                  color: pages.pageIndex == 3
                      ? Colors.lightBlueAccent
                      : Colors.white,
                  text: 'Profile',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
