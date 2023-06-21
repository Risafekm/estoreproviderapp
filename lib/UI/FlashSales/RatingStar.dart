import 'package:flutter/material.dart';

class ratingStar extends StatelessWidget {
  const ratingStar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 13,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 13,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 13,
        ),
        Icon(
          Icons.star,
          color: Colors.yellow,
          size: 13,
        ),
        Icon(
          Icons.star_half,
          color: Colors.yellow,
          size: 13,
        ),
        Text(
          "(56)",
          style: TextStyle(fontSize: 11, fontWeight: FontWeight.w300),
        ),
      ],
    );
  }
}
