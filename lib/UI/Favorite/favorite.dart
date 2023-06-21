import 'package:estoreproviderapp/Provider/ProviderCart.dart';
import 'package:estoreproviderapp/Provider/ProviderFavorite.dart';
import 'package:estoreproviderapp/UI/ProductGridView/ProductPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../Animations/PageRouteAnimations/FadePageRouteAnimation.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  get index => 0;

  List kcolors = [
    Colors.deepPurple.shade400,
    const Color.fromARGB(255, 93, 190, 14),
    Colors.cyan.shade400,
    Colors.amber.shade400,
    Colors.blue.shade400,
    Colors.deepOrange.shade400,
  ];

  @override
  Widget build(BuildContext context) {
    var myCart = context.watch<ProviderFavorite>().cartItems;
    var productCart = context.watch<ProviderFavorite>().items;

    return Scaffold(
      appBar: AppBar(
          toolbarHeight: 50,
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Text(
            'My Wishlist',
            style: GoogleFonts.lora(
              textStyle: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          actions: [
            Row(
              children: [
                Text(myCart.length.toString()),
                const SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.favorite,
                  color: myCart.isNotEmpty ? Colors.red : null,
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            ),
          ]),
      body: ListView.builder(
        itemCount: context.watch<ProviderFavorite>().cartItemsCount,
        itemBuilder: (context, index) {
          var cartItem = myCart[index];
          var colors = kcolors[index];
          // image overflow effect

          return GestureDetector(
            onTap: () {
              Navigator.of(context).push(FadePageRouteAnimation(
                  widget: ProductPage(
                    productitem: cartItem,
                  ),
                  curves: Curves.linear,
                  animationTime: const Duration(milliseconds: 700)));
            },
            child: Container(
              height: 170,
              //color: Colors.white,
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  //side design

                  Container(
                    height: 146,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: colors,
                        boxShadow: const [
                          BoxShadow(
                            offset: Offset(0, 15),
                            color: Colors.black12,
                            blurRadius: 27,
                          ),
                        ]),
                    // Canvas

                    child: Container(
                      margin: const EdgeInsets.only(right: 10, bottom: 2),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(22),
                            bottomLeft: Radius.circular(18),
                            bottomRight: Radius.circular(22),
                            topRight: Radius.circular(14)),
                        color: Colors.white,
                      ),
                    ),
                  ),

                  //image

                  Positioned(
                    top: 0,
                    left: 10,
                    child: Image.asset(
                      fit: BoxFit.fitHeight,
                      height: 160,
                      width: 150,
                      cartItem.images.toString(),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    right: 25,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * .53,
                          child: Text(
                            cartItem.itemName.toString(),
                            overflow: TextOverflow.visible,
                            maxLines: 2,
                            style: GoogleFonts.lora(
                              textStyle: const TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              cartItem.itemPrice.toString(),
                              style: GoogleFonts.lora(
                                textStyle: const TextStyle(
                                  fontSize: 22,
                                  color: Color.fromARGB(255, 93, 103, 211),
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            const SizedBox(width: 60),
                            GestureDetector(
                              onTap: () async {
                                await Future.delayed(
                                  const Duration(milliseconds: 100),
                                );
                                if (myCart.contains(cartItem)) {
                                  // ignore: use_build_context_synchronously
                                  context
                                      .read<ProviderFavorite>()
                                      .removeFromfavorite(cartItem);
                                }
                              },
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 8),
                          child: Text(
                            cartItem.itemmainPrice.toString(),
                            style: GoogleFonts.lora(
                              textStyle: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                fontSize: 15,
                                color: Color.fromARGB(255, 142, 40, 225),
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    right: 76,
                    child: Container(
                      height: 35,
                      width: 70,
                      decoration: BoxDecoration(
                        color: Colors.blue.withOpacity(.8),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Add Cart',
                          style: GoogleFonts.lora(
                            textStyle: const TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );

          // return SizedBox(
          //   height: 200,
          //   width: MediaQuery.of(context).size.width,
          //   // color: Colors.blue,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.start,
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Container(
          //         height: 200,
          //         width: 160,
          //         margin: const EdgeInsets.all(5.0),
          //         decoration: BoxDecoration(
          //           image: DecorationImage(
          //             fit: BoxFit.cover,
          //             image: NetworkImage(
          //               cartItem.images.toString(),
          //             ),
          //           ),
          //         ),
          //       ),
          //       Padding(
          //         padding:
          //             const EdgeInsets.only(left: 8.0, top: 10.0, right: 6),
          //         child: Column(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             SizedBox(
          //               width: MediaQuery.of(context).size.width * .53,
          //               child: Text(
          //                 cartItem.itemName.toString(),
          //                 overflow: TextOverflow.visible,
          //                 maxLines: 2,
          //                 style: GoogleFonts.lora(
          //                   textStyle: const TextStyle(
          //                     fontSize: 16,
          //                     color: Colors.black,
          //                     fontWeight: FontWeight.w500,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             Row(
          //               children: [
          //                 Text(
          //                   cartItem.itemPrice.toString(),
          //                   style: GoogleFonts.lora(
          //                     textStyle: const TextStyle(
          //                       fontSize: 22,
          //                       color: Color.fromARGB(255, 93, 103, 211),
          //                       fontWeight: FontWeight.w700,
          //                     ),
          //                   ),
          //                 ),
          //                 const SizedBox(width: 40),
          //                 GestureDetector(
          //                   onTap: () {
          //                     if (myCart.contains(cartItem)) {
          //                       context
          //                           .read<ProviderFavorite>()
          //                           .removeFromfavorite(cartItem);
          //                     }
          //                   },
          //                   child: const Padding(
          //                     padding: EdgeInsets.only(top: 25),
          //                     child: Icon(
          //                       Icons.favorite,
          //                       color: Colors.red,
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //             Padding(
          //               padding: const EdgeInsets.only(left: 4.0),
          //               child: Text(
          //                 cartItem.itemmainPrice.toString(),
          //                 style: GoogleFonts.lora(
          //                   textStyle: const TextStyle(
          //                     decoration: TextDecoration.lineThrough,
          //                     fontSize: 15,
          //                     color: Color.fromARGB(255, 142, 40, 225),
          //                     fontWeight: FontWeight.w700,
          //                   ),
          //                 ),
          //               ),
          //             ),
          //             const SizedBox(height: 20),
          //             Container(
          //               height: 35,
          //               decoration: BoxDecoration(
          //                 color: Colors.blue.withOpacity(.8),
          //                 borderRadius: BorderRadius.circular(10),
          //               ),
          //               child: TextButton(
          //                 onPressed: () {},
          //                 child: Text(
          //                   'Add Cart',
          //                   style: GoogleFonts.lora(
          //                     textStyle: const TextStyle(
          //                       fontSize: 15,
          //                       color: Colors.white,
          //                       fontWeight: FontWeight.w700,
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //             ),
          //           ],
          //         ),
          //       ),
          //     ],
          //   ),
          // );
        },
      ),
    );
  }
}
