import 'package:estoreproviderapp/Provider/ProviderCart.dart';
import 'package:estoreproviderapp/UI/Favorite/favorite.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Animations/PageRouteAnimations/FadePageRouteAnimation.dart';
import '../ProductGridView/gridViewItems.dart';
import '../Search/Search.dart';
import '../Widgets/widget.dart';

class BottomHomePage extends StatelessWidget {
  const BottomHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<ProviderCart>(context);

    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
          child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: containerDecoration(),
              child: Column(
                children: [
                  GridCardItems(),
                ],
              ))),
    );
  }

  PreferredSize _appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(200, 55),
      child: Container(
        padding: const EdgeInsets.only(top: 20, left: 10),
        height: 100,
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.shopify_rounded,
                    size: 30,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'EsTore',
                    style: GoogleFonts.lora(
                      textStyle: const TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).push(FadePageRouteAnimation(
                    widget: const SearchPage(),
                    curves: Curves.linear,
                    animationTime: const Duration(milliseconds: 800)));
              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10, left: 70),
                child: Container(
                  height: 35,
                  width: 150,
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 33, 149, 243),
                      borderRadius: BorderRadius.circular(20)),
                  child: Row(
                    children: const [
                      SizedBox(width: 15),
                      Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Search',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.only(top: 10.0, right: 8),
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const FavoritePage()));
                  },
                  child: Icon(
                    Icons.favorite_sharp,
                    color: Colors.blue[200],
                    size: 28,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
