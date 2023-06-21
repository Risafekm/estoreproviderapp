import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Model/promotionmodel.dart';
import 'RatingStar.dart';

// ignore: must_be_immutable
class FlashSales extends StatelessWidget {
  FlashSales({Key? key}) : super(key: key);

  String countTime = 'Loading...';

  bool isCount = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: 420,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 190, 192, 216),
              Color.fromARGB(255, 189, 193, 240),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 10, top: 10),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 22,
                        child: Icon(
                          Icons.shopping_bag_rounded,
                          color: Colors.black87,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          'Flash Sales',
                          style: GoogleFonts.lora(
                            textStyle: const TextStyle(
                              fontSize: 22,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 18, bottom: 7, left: 20, right: 30),
                      child: Text(
                        'End Sale in : Date',
                        style: GoogleFonts.lora(
                          textStyle: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              height: 300,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 190, 192, 216),
                    Color.fromARGB(255, 189, 193, 240),
                  ],
                ),
              ),
              child: ListView.builder(
                itemCount: promotionitem.length,
                // itemCount: snapshot.data.docs.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: Container(
                          height: 350,
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
                                child: Text(
                                  promotionitem[index]
                                      .flashmainprice
                                      .toString(),
                                  maxLines: 1,
                                  style: GoogleFonts.lora(
                                    textStyle: const TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(255, 142, 40, 225),
                                        decoration: TextDecoration.lineThrough),
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
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
                                      color: Color.fromARGB(255, 93, 103, 211),
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

                              //LocationItem
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, top: 8, right: 8),
                                child: GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.location_on,
                                        size: 12,
                                        color: Colors.grey,
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        promotionitem[index]
                                            .flashlocation
                                            .toString(),
                                        maxLines: 1,
                                        style: GoogleFonts.lora(
                                          textStyle: const TextStyle(
                                            fontSize: 10,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              //availableCount
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8, top: 8, right: 8),
                                child: Text(
                                  promotionitem[index]
                                      .flashavailable
                                      .toString(),
                                  maxLines: 1,
                                  style: GoogleFonts.lora(
                                    textStyle: const TextStyle(
                                      fontSize: 13,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      //  fontFamily: 'ArchivoBlack',
                                    ),
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
            ),
          ],
        ),
      ),
    );
  }
}
