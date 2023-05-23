import 'package:estoreproviderapp/Provider/ProviderBottomNavigation.dart';
import 'package:estoreproviderapp/UI/Widgets/BottomNaviagtionBAR.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'BottomNavigationBarPages/BottomCart.dart';
import 'BottomNavigationBarPages/BottomHomePage.dart';
import 'BottomNavigationBarPages/BottomProfile.dart';
import 'BottomNavigationBarPages/BottomBrand.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  List<Widget> pageList = const [
    BottomHomePage(),
    BottomBrand(),
    BottomCart(),
    BottomProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    var pageValue = context.watch<ProviderBottomNavigation>();

    return Consumer<ProviderBottomNavigation>(
      builder: (context, pages, child) {
        return Scaffold(
          bottomNavigationBar: const BottomNavigationBAR(),
          body: pageList[pageValue.pageIndex],
        );
      },
    );
  }
}
