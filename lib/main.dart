import 'package:estoreproviderapp/Provider/ProviderBottomNavigation.dart';
import 'package:estoreproviderapp/Provider/ProviderBrand.dart';
import 'package:estoreproviderapp/Provider/ProviderCart.dart';
import 'package:estoreproviderapp/UI/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => ProviderBottomNavigation()),
          ChangeNotifierProvider(create: (context) => ProviderCart()),
          ChangeNotifierProvider(create: (context) => ProviderBrand()),
        ],
        child: MainScreen(),
      ),
    );
  }
}
