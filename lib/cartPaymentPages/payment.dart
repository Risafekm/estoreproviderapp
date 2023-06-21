import 'package:estoreproviderapp/UI/MainScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:slide_to_act/slide_to_act.dart';

class Payment extends StatelessWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBAR(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mainText(),
            paymentOptions(),
            const SizedBox(
              height: 40,
            ),
            const Center(child: PayMoney()),
          ],
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
        'Payment',
        style: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 20,
            color: Color.fromARGB(175, 0, 0, 0),
            fontWeight: FontWeight.bold,
          ),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Text(
        'Choose your payment \nmethod',
        maxLines: 2,
        style: GoogleFonts.libreBaskerville(
          textStyle: const TextStyle(
              fontSize: 25,
              letterSpacing: 1,
              color: Color.fromARGB(171, 0, 0, 0),
              fontWeight: FontWeight.w500),
        ),
      ),
    );
  }

  paymentOptions() {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Column(
        children: const [
          PaymentOption(
            title: "Credit / Debit Card",
            images: 'assets/payment/creditcard.png',
            space: 25,
            scaleicon: 8.4,
          ),
          Divider(
            thickness: 1,
          ),
          PaymentOption(
            title: "Gpay ",
            images: 'assets/payment/gpay.png',
            space: 149,
            scaleicon: 21.3,
          ),
          Divider(
            thickness: 1,
          ),
          PaymentOption(
            title: "Paytm",
            images: 'assets/payment/paytm.png',
            space: 143,
            scaleicon: 16.7,
          ),
          Divider(
            thickness: 1,
          ),
          PaymentOption(
            title: "Amazon Pay",
            images: 'assets/payment/amazonpay1.png',
            space: 86,
            scaleicon: 28.5,
          ),
          Divider(
            thickness: 1,
          ),
          PaymentOption(
            title: "Cash On Delivery",
            images: 'assets/payment/cashondelivery.webp',
            space: 45,
            scaleicon: 38.5,
          ),
        ],
      ),
    );
  }

  // Widget paymentButton(BuildContext context) {
  //   return SizedBox(
  //     height: 50,
  //     width: 250,
  //     child: ElevatedButton(
  //         onPressed: () {
  //           Navigator.of(context).push(
  //             PageRouteAnimation(
  //               alignment: Alignment.bottomLeft,
  //               animationTime: const Duration(milliseconds: 300),
  //               curves: Curves.linear,
  //               widget: const PayMoney(),
  //             ),
  //           );
  //         },
  //         style: elevatedButtonStyle(),
  //         child: Text(
  //           'Pay',
  //           style: GoogleFonts.crimsonText(
  //               fontSize: 22, fontWeight: FontWeight.bold),
  //         )),
  //   );
  // }
}

class PaymentOption extends StatefulWidget {
  final String title;
  final String images;
  final double space;
  final double scaleicon;

  const PaymentOption(
      {required this.title,
      required this.images,
      required this.space,
      required this.scaleicon});

  @override
  State<PaymentOption> createState() => _PaymentOptionState();
}

class _PaymentOptionState extends State<PaymentOption> {
  bool isClick = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 45, bottom: 14, top: 14),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isClick = !isClick;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            isClick
                ? const Icon(
                    Icons.radio_button_checked,
                    size: 22,
                    color: Colors.green,
                  )
                : const Icon(
                    Icons.radio_button_unchecked,
                    size: 22,
                  ),
            const SizedBox(
              width: 20,
            ),
            Text(
              widget.title,
              style: const TextStyle(
                  fontSize: 19, fontWeight: FontWeight.w500, letterSpacing: 1),
            ),
            SizedBox(
              width: widget.space,
            ),
            Container(
              height: 30,
              width: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.none,
                  scale: widget.scaleicon,
                  image: AssetImage(widget.images),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PayMoney extends StatelessWidget {
  const PayMoney({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 60, right: 60, top: 10),
      child: SlideAction(
        height: 55,
        sliderButtonIconSize: 22,
        sliderButtonYOffset: 0.5,
        sliderRotate: false,
        borderRadius: 12,
        sliderButtonIconPadding: 14,
        outerColor: Colors.blue,
        submittedIcon: const Icon(
          Icons.check,
          size: 35,
          color: Colors.white,
        ),
        text: 'Slide to Pay',
        textStyle: const TextStyle(
          fontSize: 18,
          color: Colors.white,
        ),
        onSubmit: (() {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MainScreen()));
        }),
      ),
    );
  }
}
