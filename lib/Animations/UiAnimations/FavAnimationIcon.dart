import 'package:estoreproviderapp/Provider/ProviderCart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavAnimationIcon extends StatefulWidget {
  const FavAnimationIcon({Key? key}) : super(key: key);

  @override
  State<FavAnimationIcon> createState() => _FavAnimationIconState();
}

class _FavAnimationIconState extends State<FavAnimationIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _colorAnimation;
  late Animation<double> _sizeAnimation;

  bool isFav = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(
        milliseconds: 200,
      ),
      vsync: this,
    );

    //ColorAnimation

    _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red)
        .animate(_controller);

    //SizeAnimation

    _sizeAnimation = TweenSequence(
      <TweenSequenceItem<double>>[
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 26, end: 35), weight: 35),
        TweenSequenceItem<double>(
            tween: Tween<double>(begin: 35, end: 26), weight: 35),
      ],
    ).animate(_controller);

    _controller.addListener(() {
      // ignore: avoid_print
      print(_controller.value);
      // ignore: avoid_print
      print(_colorAnimation.value);
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          isFav = true;
        });
      }
      if (status == AnimationStatus.dismissed) {
        setState(() {
          isFav = false;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (
        BuildContext context,
        Widget? _,
      ) {
        return IconButton(
          onPressed: () {
            isFav ? _controller.reverse() : _controller.forward();
          },
          icon: Icon(
            Icons.favorite,
            size: _sizeAnimation.value,
            color: _colorAnimation.value,
          ),
        );
      },
    );
  }
}
