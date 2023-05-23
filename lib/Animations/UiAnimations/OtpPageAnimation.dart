import 'dart:async';

import 'package:flutter/material.dart';

class OtpAnimation extends StatefulWidget {
  final Widget child;
  final int aniDuration;
  final double aniX;
  final double aniY;
  final int delayedAnimation;

  const OtpAnimation({
    Key? key,
    required this.child,
    required this.aniDuration,
    required this.aniX,
    required this.aniY,
    required this.delayedAnimation,
  }) : super(key: key);

  @override
  State<OtpAnimation> createState() => _OtpAnimationState();
}

class _OtpAnimationState extends State<OtpAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: widget.aniDuration));

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Interval(widget.aniX, widget.aniY, curve: Curves.bounceIn),
    );

    if (widget.delayedAnimation == null) {
      _controller.forward();
    } else {
      Timer(Duration(milliseconds: widget.delayedAnimation), () {
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
    return FadeTransition(
      opacity: _controller,
      child: ScaleTransition(
        scale: _animation,
        child: widget.child,
      ),
    );
  }
}
