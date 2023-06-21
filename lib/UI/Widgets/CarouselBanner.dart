import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OfferBanner extends StatefulWidget {
  const OfferBanner({super.key});

  @override
  State<OfferBanner> createState() => _OfferBannerState();
}

class _OfferBannerState extends State<OfferBanner> {
  bool isLoading = false;

  final imageSlider = [
    'assets/banner/offer.webp',
    'assets/banner/offer1.webp',
    'assets/banner/offer2.webp',
    'assets/banner/offer3.webp',
    'assets/banner/offer4.webp',
    'assets/banner/offer5.jpg',
    'assets/banner/offer6.webp'
  ];

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
    return CarouselSlider.builder(
      itemCount: imageSlider.length,
      itemBuilder: (context, index, realindex) {
        final urlImage = imageSlider[index].toString();
        return Image.asset(
          urlImage,
          width: 600,
          fit: BoxFit.cover,
        );
      },
      options: CarouselOptions(
          height: 200,
          autoPlay: true,
          viewportFraction: 1.0,
          autoPlayInterval: const Duration(seconds: 6)),
    );
  }

  // shimmerWidget() {
  //   return Shimmer.fromColors(
  //     baseColor: Colors.grey,
  //     highlightColor: Colors.grey.shade100,
  //     child: Container(
  //       margin: const EdgeInsets.all(5),
  //       color: Colors.white,
  //       height: 190,
  //       width: 600,
  //     ),
  //   );
  // }
}
