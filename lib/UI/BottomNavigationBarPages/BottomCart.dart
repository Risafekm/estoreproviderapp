import 'package:estoreproviderapp/Provider/ProviderCart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import '../../Animations/PageRouteAnimations/FadePageRouteAnimation.dart';
import '../../Model/promotionmodel.dart';
import '../Search/Search.dart';
import '../Widgets/widget.dart';

class BottomCart extends StatefulWidget {
  const BottomCart({super.key});

  @override
  State<BottomCart> createState() => _BottomCartState();
}

class _BottomCartState extends State<BottomCart> {
  bool isLoaded = false;

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        isLoaded = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(context),
      body: isLoaded
          ? SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.grey.shade300,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Column(
                            children: [
                              picAndName(context),
                              const Divider(
                                thickness: 2,
                              ),
                              totalANdPayButton(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          : cartShimmer(context),
    );
  }

  Shimmer cartShimmer(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 140,
                  width: 140,
                  color: Colors.white,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 4),
                        Container(
                          height: 50,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
              height: 4,
              color: Colors.white,
            ),
            Container(
              height: 50,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }

  Widget picAndName(BuildContext context) {
    context.watch<ProviderCart>();
    return Consumer<ProviderCart>(
      builder: (context, value, child) {
        return SizedBox(
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: 140,
                    width: 140,
                    child: const Center(
                      child: Text(
                        'A',
                        style: TextStyle(fontSize: 32),
                      ),
                    ),
                    //  Image.asset(
                    //   '',
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        promotionitem[5].flashname.toString(),
                        maxLines: 2,
                        style: GoogleFonts.lora(
                          textStyle: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 46,
                left: 200,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                  child: mainPriceItem(5),
                ),
              ),
              Positioned(
                top: 45,
                left: 150,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8, top: 8, right: 8),
                  child: Text(
                    promotionitem[5].flashofferprice.toString(),
                    maxLines: 1,
                    style: GoogleFonts.lora(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 93, 103, 211),
                      ),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 15,
                left: 150,
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        value.subCount();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 25,
                        width: 30,
                        color: Colors.white24,
                        child: const Text(
                          '-',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 25,
                      width: 40,
                      color: Colors.white38,
                      child: Text(
                        value.count.toString(),
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        value.addCount();
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 25,
                        width: 30,
                        color: Colors.white24,
                        child: const Text(
                          '+',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget totalANdPayButton() {
    return Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: 'Total: ',
                style: GoogleFonts.almendra(fontSize: 18, color: Colors.black)),
            TextSpan(
              text: promotionitem[5].flashofferprice,
              style: GoogleFonts.lora(
                textStyle: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ]),
        ),
        const SizedBox(
          width: 130,
        ),
        Container(
          clipBehavior: Clip.none,
          height: 34,
          width: 120,
          decoration: const BoxDecoration(
            color: Colors.blue,
          ),
          child: MaterialButton(
            onPressed: () {
              // Navigator.of(context).push(
              //   PageRouteAnimation(
              //     widget: const ShippingAddress(),
              //     curves: Curves.fastOutSlowIn,
              //     alignment: Alignment.centerRight,
              //     animationTime: const Duration(milliseconds: 400),
              //   ),
              // );
            },
            child: Text(
              'Pay',
              style: GoogleFonts.lora(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
      ],
    );
  }

  PreferredSize _appBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size(200, 55),
      child: Container(
        padding: const EdgeInsets.only(top: 20),
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
                    Icons.shopping_cart,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Cart',
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
                padding: const EdgeInsets.only(top: 10, left: 80),
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
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
