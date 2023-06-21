import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../Animations/UiAnimations/ScaleAnimation.dart';

class IconGrid extends StatelessWidget {
  const IconGrid({
    Key? key,
    required this.icon1,
    required this.name1,
    required this.color1,
    required this.icon2,
    required this.name2,
    required this.color2,
    required this.icon3,
    required this.name3,
    required this.color3,
    required this.icon4,
    required this.name4,
    required this.color4,
    // required this.icon5,
    //   required this.name5,
  }) : super(key: key);

  final IconData icon1;
  final String name1;
  final Color color1;
  final IconData icon2;
  final String name2;
  final Color color2;
  final IconData icon3;
  final String name3;
  final Color color3;
  final IconData icon4;
  final String name4;
  final Color color4;
  // final IconData icon5;
  //final String name5;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ScaleAnimation(
                  delayTime: 500,
                  child: Icon(
                    icon1,
                    color: color1,
                    size: 26,
                  ),
                ),
              ),
            ),
            Text(
              name1,
              style: GoogleFonts.lora(
                textStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  //  fontFamily: 'ArchivoBlack',
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ScaleAnimation(
                  delayTime: 500,
                  child: Icon(
                    icon2,
                    color: color2,
                    size: 26,
                  ),
                ),
              ),
            ),
            Text(
              name2,
              style: GoogleFonts.lora(
                textStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  //  fontFamily: 'ArchivoBlack',
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ScaleAnimation(
                  delayTime: 500,
                  child: Icon(
                    icon3,
                    color: color3,
                    size: 26,
                  ),
                ),
              ),
            ),
            Text(
              name3,
              style: GoogleFonts.lora(
                textStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  //  fontFamily: 'ArchivoBlack',
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.teal.shade100,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: ScaleAnimation(
                  delayTime: 500,
                  child: Icon(
                    icon4,
                    color: color4,
                    size: 26,
                  ),
                ),
              ),
            ),
            Text(
              name4,
              style: GoogleFonts.lora(
                textStyle: const TextStyle(
                  fontSize: 12,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  //  fontFamily: 'ArchivoBlack',
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
