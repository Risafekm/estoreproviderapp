import 'package:estoreproviderapp/Provider/ProviderBottomNavigation.dart';
import 'package:estoreproviderapp/Provider/ProviderBrand.dart';
import 'package:estoreproviderapp/Provider/ProviderCart.dart';
import 'package:estoreproviderapp/Provider/ProviderFavorite.dart';
import 'package:estoreproviderapp/UI/SplashScreen/SplashScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (BuildContext context) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => ProviderBottomNavigation()),
          ChangeNotifierProvider(create: (context) => ProviderCart()),
          ChangeNotifierProvider(create: (context) => ProviderFavorite()),
          ChangeNotifierProvider(create: (context) => ProviderBrand()),
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          // home: MainScreen(),
          home: SplashScreen(),
        ),
      );
    });
  }
}
