import 'package:flutter/material.dart';

class PageRouteAnimation extends PageRouteBuilder {
  final Widget widget;
  final Curve curves;

  final Alignment alignment;
  final Duration animationTime;
  PageRouteAnimation(
      {required this.widget,
      required this.alignment,
      required this.curves,
      required this.animationTime})
      : super(
          pageBuilder: ((BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return widget;
          }),
          transitionDuration: animationTime,
          transitionsBuilder: (BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child) {
            animation = CurvedAnimation(parent: animation, curve: curves);

            return ScaleTransition(
              alignment: alignment,
              child: child,
              scale: animation,
            );
          },
        );
}
