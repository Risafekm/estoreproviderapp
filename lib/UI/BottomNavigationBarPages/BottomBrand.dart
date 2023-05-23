import 'package:estoreproviderapp/Model/brand.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Animations/PageRouteAnimations/FadePageRouteAnimation.dart';
import '../Search/Search.dart';
import 'package:shimmer/shimmer.dart';

// ignore: must_be_immutable
class BottomBrand extends StatefulWidget {
  const BottomBrand({super.key});

  @override
  State<BottomBrand> createState() => _BottomBrandState();
}

class _BottomBrandState extends State<BottomBrand> {
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(context),
      body: isLoading
          ? ListView.builder(
              itemCount: brandItems.length,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 130,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(brandItems[index].images),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: Text(brandItems[index].name.toString(),
                            style: GoogleFonts.paytoneOne(
                                fontSize: 29,
                                fontWeight: FontWeight.w300,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                );
              }))
          : shimmerWidget(),
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
                    Icons.shopping_bag,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Brand',
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
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Shimmer shimmerWidget() {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.builder(
          itemCount: brandItems.length,
          itemBuilder: ((context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: () {},
                child: Stack(
                  children: [
                    Container(
                      height: 130,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: Container(
                        height: 80,
                        width: 300,
                        color: Colors.white,
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
