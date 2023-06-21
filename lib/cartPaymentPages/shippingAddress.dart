import 'package:estoreproviderapp/cartPaymentPages/payment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Animations/PageRouteAnimations/PageRouteAnimaton.dart';
import '../UI/Widgets/widget.dart';

class ShippingAddress extends StatelessWidget {
  const ShippingAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBAR(context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
            children: [
              mainText(),
              const SizedBox(
                height: 60,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Pin Code',
                    hintStyle: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(175, 0, 0, 0),
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Locality',
                    hintStyle: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(175, 0, 0, 0),
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'City',
                    hintStyle: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(175, 0, 0, 0),
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'State',
                    hintStyle: TextStyle(
                        fontSize: 18,
                        color: Color.fromARGB(175, 0, 0, 0),
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              const SizedBox(
                height: 80,
              ),
              paymentButton(context),
            ],
          ),
        ),
      ),
    );
  }

  AppBar appBAR(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      centerTitle: true,
      title: Text(
        'Delivery',
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
              fontSize: 20,
              color: Color.fromARGB(175, 0, 0, 0),
              fontWeight: FontWeight.bold),
        ),
      ),
      leading: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.arrow_back_ios,
          size: 22,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget mainText() {
    return Text(
      'Where are your ordered\n items shipped ?',
      maxLines: 2,
      style: GoogleFonts.libreBaskerville(
        textStyle: const TextStyle(
            fontSize: 24,
            letterSpacing: 1,
            color: Color.fromARGB(151, 0, 0, 0),
            fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget paymentButton(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 250,
      child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(
              PageRouteAnimation(
                alignment: const Alignment(0.0, 0.7),
                animationTime: const Duration(milliseconds: 300),
                curves: Curves.linear,
                widget: const Payment(),
              ),
            );
          },
          style: elevatedButtonStyle(),
          child: Text(
            'Go to payment',
            style: GoogleFonts.crimsonText(
                fontSize: 22, fontWeight: FontWeight.bold),
          )),
    );
  }
}
