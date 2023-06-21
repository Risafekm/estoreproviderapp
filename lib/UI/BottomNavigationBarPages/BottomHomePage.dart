import 'package:estoreproviderapp/Provider/ProviderCart.dart';
import 'package:estoreproviderapp/Provider/ProviderFavorite.dart';
import 'package:estoreproviderapp/UI/Favorite/favorite.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Animations/PageRouteAnimations/FadePageRouteAnimation.dart';
import '../../Model/categoryModel.dart';
import '../../Model/promotionmodel.dart';
import '../CategoryGridItem/icon.dart';
import '../FlashSales/FlashSales.dart';
import '../ProductGridView/gridViewItems.dart';
import '../Search/Search.dart';
import '../Widgets/CarouselBanner.dart';
import '../Widgets/widget.dart';

class BottomHomePage extends StatelessWidget {
  const BottomHomePage({super.key});

  get index => 0;

  @override
  Widget build(BuildContext context) {
    var productCart = context.watch<ProviderCart>().items;
    var mycart = context.watch<ProviderCart>().cartItems;

    return Scaffold(
      appBar: _appBar(context),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: containerDecoration(),
          child: Column(
            children: [
              const OfferBanner(),
              category(),
              const SizedBox(height: 5),
              iconGrid(),
              const SizedBox(height: 1),
              promotionItemCard(),
              FlashSales(),
              const GridCardItems(),
            ],
          ),
        ),
      ),
    );
  }

  PreferredSize _appBar(BuildContext context) {
    var mycart = context.watch<ProviderFavorite>().cartItems;
    var productCart = context.watch<ProviderFavorite>().items;

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
                    animationTime: const Duration(milliseconds: 500)));
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
                        builder: (context) => FavoritePage()));
                  },
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Icon(
                        Icons.favorite_sharp,
                        color:
                            mycart.isNotEmpty ? Colors.red : Colors.blue[200],
                        size: 28,
                      ),
                      // Positioned(
                      //   left: -5,
                      //   child: Text(
                      //     mycart.length.toString(),
                      //     style: const TextStyle(color: Colors.white),
                      //   ),
                      // ),
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }

  Widget iconGrid() {
    return Container(
      height: 230,
      decoration: BoxDecoration(color: Colors.grey.shade200, boxShadow: const [
        BoxShadow(
          color: Colors.grey,
          offset: Offset(5, 5),
          blurRadius: 20,
        ),
      ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),

        //Main Column

        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15.0, top: 2, bottom: 13),
                  child: Text(
                    'Menu',
                    style: GoogleFonts.lora(
                      textStyle: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // 1st Row

            const IconGrid(
              icon1: Icons.camera_alt_sharp,
              name1: 'Camera',
              color1: Colors.blueAccent,
              icon2: Icons.hotel_class_outlined,
              name2: 'Hotel',
              color2: Colors.green,
              icon3: Icons.theaters_outlined,
              name3: 'Ticket cinema',
              color3: Colors.blueGrey,
              icon4: Icons.gamepad_sharp,
              name4: 'Game',
              color4: Colors.red,
            ),

            const SizedBox(
              height: 20,
            ),

            const IconGrid(
              icon1: Icons.watch,
              name1: 'Watches',
              color1: Colors.green,
              icon2: Icons.health_and_safety,
              name2: 'Health',
              color2: Colors.deepPurple,
              icon3: Icons.computer_sharp,
              name3: 'Computer',
              color3: Colors.green,
              icon4: Icons.airplane_ticket,
              name4: 'Air ticket',
              color4: Colors.orange,
            ),

            const SizedBox(
              height: 20,
            ),

            const IconGrid(
              icon1: Icons.sports_rounded,
              name1: 'Sports',
              color1: Colors.orange,
              icon2: Icons.train_outlined,
              name2: 'Train',
              color2: Colors.red,
              icon3: Icons.smartphone_sharp,
              name3: 'Smart Phone',
              color3: Colors.deepPurple,
              icon4: Icons.car_rental,
              name4: 'Cabin',
              color4: Colors.blueAccent,
            ),
          ], //Column ending
        ),
      ),
    );
  }

  Widget promotionItemCard() {
    return Container(
      height: 220,
      decoration: BoxDecoration(color: Colors.grey.shade200, boxShadow: const [
        BoxShadow(
          color: Colors.white12,
          offset: Offset(-5, -5),
          blurRadius: 20,
        ),
      ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 15.0,
            ),
            child: Text(
              'Week Promotion',
              style: GoogleFonts.lora(
                textStyle: const TextStyle(
                  fontSize: 17,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 170,
            decoration:
                BoxDecoration(color: Colors.grey.shade200, boxShadow: const [
              BoxShadow(
                color: Colors.white12,
                offset: Offset(-5, -5),
                blurRadius: 20,
              ),
            ]),
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: ListView.builder(
                itemCount: promotionitem.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          color: Colors.teal.shade500,
                          height: 160,
                          width: 130,
                          child: Stack(
                            children: [
                              Image.network(
                                promotionitem[index].promotionimages.toString(),
                                height: 130,
                                width: 140,
                                fit: BoxFit.cover,
                              ),
                              Positioned(
                                bottom: 8,
                                left: 10,
                                child: RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                      text: promotionitem[index].offertext,
                                      style: GoogleFonts.lora(
                                        textStyle: const TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(
                                              255, 243, 243, 241),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          promotionitem[index].offerpercentage,
                                      style: GoogleFonts.lora(
                                        textStyle: const TextStyle(
                                          fontSize: 18,
                                          color: Color.fromARGB(
                                              255, 243, 243, 241),
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ]),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget category() {
    return SingleChildScrollView(
      child: Container(
        height: 147,
        width: double.infinity,
        color: Colors.grey.shade200,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 4),
            child: Text(
              'Category',
              style: GoogleFonts.lora(
                textStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 110,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
            ),
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: categoryModel.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: InkWell(
                        onTap: () {},
                        child: Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey.shade400,
                                  offset: const Offset(0, 0.5),
                                  blurRadius: 10,
                                  spreadRadius: 5)
                            ],
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                categoryModel[index].images.toString(),
                              ),
                            ),
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      categoryModel[index].categorytext.toString(),
                      style: GoogleFonts.lora(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                );
              }),
            ),
          ),
        ]),
      ),
    );
  }
}
