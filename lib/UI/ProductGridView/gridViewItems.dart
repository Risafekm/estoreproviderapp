import 'dart:math';

import 'package:estoreproviderapp/Provider/ProviderCart.dart';
import 'package:estoreproviderapp/Provider/ProviderFavorite.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../Animations/UiAnimations/FavAnimationIcon.dart';
import '../../Animations/UiAnimations/likeAnimation.dart';
import 'ProductPage.dart';

// ignore: must_be_immutable
class GridCardItems extends StatefulWidget {
  const GridCardItems({Key? key}) : super(key: key);

  @override
  State<GridCardItems> createState() => _GridCardItemsState();
}

class _GridCardItemsState extends State<GridCardItems> {
  bool isLoading = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        isLoading = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var productCart = context.watch<ProviderFavorite>().items;
    var mycart = context.watch<ProviderFavorite>().cartItems;

    return isLoading
        ? Container(
            color: Colors.grey.shade300,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //GridView.builder
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, top: 5),
                  child: Text(
                    'End of Season Sale',
                    style: GoogleFonts.lora(
                      textStyle: const TextStyle(
                        fontSize: 17,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 14),
                GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 4,
                            mainAxisSpacing: 5,
                            mainAxisExtent: 350),
                    itemCount: productCart.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: ((context, index) {
                      //
                      var item = productCart[index];

                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProductPage(
                                      productitem: item,
                                    )));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //Item images

                                Hero(
                                  tag: 'tag-1-${item.images.toString()}',
                                  transitionOnUserGestures: true,
                                  child: Container(
                                    height: 250,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade100,
                                            blurRadius: 10.0,
                                            spreadRadius: 0.4,
                                            offset: const Offset(0, 1)),
                                      ],
                                    ),
                                    child: Image.asset(
                                      item.images.toString(),
                                      fit: BoxFit.cover,
                                      height: 250,
                                      width: 200,
                                    ),
                                  ),
                                ),
                                //itemName

                                Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Text(
                                    item.itemName.toString(),
                                    maxLines: 2,
                                    style: GoogleFonts.lora(
                                      textStyle: const TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),

                                //itemPrice

                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            item.itemPrice.toString(),
                                            style: GoogleFonts.lora(
                                              textStyle: const TextStyle(
                                                fontSize: 18,
                                                color: Color.fromARGB(
                                                    255, 93, 103, 211),
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),

                                          //itemMainPrice

                                          Text(
                                            item.itemmainPrice.toString(),
                                            style: GoogleFonts.lora(
                                              textStyle: const TextStyle(
                                                fontSize: 13,
                                                decoration:
                                                    TextDecoration.lineThrough,
                                                color: Color.fromARGB(
                                                    255, 142, 40, 225),
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 40,
                                          ),
                                        ],
                                      ),

                                      // FavANimationIcon

                                      Positioned(
                                        right: 25,
                                        top: -5,
                                        // child: FavAnimationIcon(),
                                        child: IconButton(
                                          onPressed: () async {
                                            await Future.delayed(const Duration(
                                                milliseconds: 100));
                                            try {
                                              if (mycart.contains(item)) {
                                                // ignore: use_build_context_synchronously
                                                context
                                                    .read<ProviderFavorite>()
                                                    .removeFromfavorite(item);
                                              } else {
                                                // ignore: use_build_context_synchronously
                                                context
                                                    .read<ProviderFavorite>()
                                                    .addTOfavorite(item);
                                              }
                                            } catch (e) {
                                              print('Error');
                                            }
                                          },
                                          icon: Icon(
                                            Icons.favorite,
                                            color: mycart.contains(item)
                                                ? Colors.red
                                                : Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),

                                //itemStar

                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      Text(
                                        item.itemStar.toString(),
                                        maxLines: 1,
                                        style: const TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 51, 227, 16),
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const Icon(
                                        Icons.star,
                                        size: 16,
                                        color:
                                            Color.fromARGB(255, 229, 209, 25),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    })),
              ],
            ),
          )
        : shimmerWidget();
  }

  Shimmer shimmerWidget() {
    var productCart = context.watch<ProviderCart>().items;
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.grey.shade100,
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4,
              mainAxisSpacing: 5,
              mainAxisExtent: 350),
          itemCount: productCart.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: ((context, index) {
            final item = productCart[index];
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: Colors.white,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Item images

                    Container(
                      height: 250,
                      width: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    //itemName

                    Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                        height: 15,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),

                    //itemPrice

                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 13,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),

                    //itemStar

                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 10,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            height: 10,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          })),
    );
  }
}
