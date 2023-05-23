import 'dart:async';

import 'package:flutter/material.dart';

class ButtonAnimation extends StatefulWidget {
  final Widget child;
  final int delayAnimation;

  const ButtonAnimation(
      {Key? key, required this.child, required this.delayAnimation})
      : super(key: key);

  @override
  State<ButtonAnimation> createState() => _ButtonAnimationState();
}

class _ButtonAnimationState extends State<ButtonAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    if (widget.delayAnimation == null) {
      _controller.forward();
    } else {
      Timer(Duration(milliseconds: widget.delayAnimation), () {
        _controller.forward();
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.25, 1.1),
      ),
      child: widget.child,
    );
  }
}
