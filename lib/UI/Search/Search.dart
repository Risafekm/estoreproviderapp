import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Model/promotionmodel.dart';
import '../FlashSales/RatingStar.dart';
import '../Widgets/widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  TextEditingController searchText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBar(),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              mainHeading(),
              searchBox(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    popularityText(),
                    const SizedBox(
                      height: 20,
                    ),
                    popularityColumn(),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: Container(
                height: double.infinity,
                color: Colors.grey.shade200,
                child: ListView.builder(
                  itemCount: promotionitem.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Container(
                            height: 250,
                            width: 160,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //item image
                                Image.network(
                                  promotionitem[index].images.toString(),
                                  height: 130,
                                  width: 160,
                                  fit: BoxFit.fill,
                                ),

                                //item title
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, top: 8, right: 8),
                                  child: Text(
                                    promotionitem[index].flashname.toString(),
                                    maxLines: 2,
                                    style: GoogleFonts.lora(
                                      textStyle: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ),

                                //item main price
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, top: 8, right: 8),
                                  child: mainPriceItem(index),
                                ),

                                //item offer price
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, top: 8, right: 8),
                                  child: Text(
                                    promotionitem[index]
                                        .flashofferprice
                                        .toString(),
                                    maxLines: 1,
                                    style: GoogleFonts.lora(
                                      textStyle: const TextStyle(
                                        fontSize: 16,
                                        color:
                                            Color.fromARGB(255, 93, 103, 211),
                                      ),
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),

                                //RatingStar
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 8, top: 8, right: 8),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      children: const [
                                        ratingStar(),
                                      ],
                                    ),
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
              )),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: const Text(
        'Search',
        style: TextStyle(
          fontSize: 22,
          color: Color.fromARGB(212, 30, 29, 29),
        ),
      ),
      leading: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: const Icon(
          Icons.arrow_back_ios,
          size: 24,
          color: Color.fromARGB(255, 24, 23, 23),
        ),
      ),
    );
  }

  Widget mainHeading() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Text(
        'Hello, i am Estore. What \nWould you like to \nSearch ?',
        style: GoogleFonts.lora(
            fontSize: 29, color: const Color.fromARGB(160, 5, 5, 5)),
      ),
    );
  }

  Widget searchBox() {
    return Padding(
      padding:
          const EdgeInsets.only(left: 10.0, right: 10.0, top: 20, bottom: 20),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade400,
                  spreadRadius: 2,
                  offset: const Offset(0.0, 0.2),
                  blurRadius: 20),
            ]),
        height: 45,
        child: TextField(
          style: const TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w400,
          ),
          showCursor: true,
          controller: searchText,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.only(
              top: 10,
              bottom: 10,
              left: 25,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Search',
            prefixIcon: const Icon(Icons.search),
            prefixIconColor: Colors.black,
            hintStyle: GoogleFonts.lora(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Widget popularityText() {
    return const Text(
      'Popularity',
      style: TextStyle(
          fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black87),
    );
  }

  Widget popularityColumn() {
    return Column(
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              PopularityItems(name: 'Iphone X'),
              const SizedBox(width: 10),
              PopularityItems(name: 'Samsung'),
              const SizedBox(width: 10),
              PopularityItems(name: 'One plus'),
              const SizedBox(width: 10),
              PopularityItems(name: 'Watch'),
            ],
          ),
        ),
        const SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              PopularityItems(name: 'Macbook'),
              const SizedBox(width: 10),
              PopularityItems(name: 'Gaming pc'),
              const SizedBox(width: 10),
              PopularityItems(name: 'Ipad'),
              const SizedBox(width: 10),
              PopularityItems(name: 'Fasion'),
            ],
          ),
        ),
      ],
    );
  }
}

// ignore: must_be_immutable
class PopularityItems extends StatelessWidget {
  String name;
  PopularityItems({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 28,
      width: 84,
      child: Center(
        child: Text(
          name,
          style: TextStyle(color: Colors.grey.shade700),
        ),
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.shade300,
                spreadRadius: 3,
                offset: const Offset(0.0, 0.2),
                blurRadius: 20,
                blurStyle: BlurStyle.inner),
          ]),
    );
  }
}
