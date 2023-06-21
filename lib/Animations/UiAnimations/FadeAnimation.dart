import 'package:flutter/material.dart';

class FadeAnimation extends StatefulWidget {
  final Widget child;

  const FadeAnimation({Key? key, required this.child}) : super(key: key);

  @override
  State<FadeAnimation> createState() => _FadeAnimationState();
}

class _FadeAnimationState extends State<FadeAnimation>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation animation;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );
    final curve =
        CurvedAnimation(parent: _controller, curve: Curves.easeOutCirc);
    animation = Tween(begin: 0.0, end: 2.0).animate(_controller);
    _scale = Tween(begin: 0.0, end: 1.0).animate(curve);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return ScaleTransition(
      scale: _scale,
      child: FadeTransition(
        opacity: _controller,
        child: widget.child,
      ),
    );
  }
}
