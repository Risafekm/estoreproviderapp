import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ButtonAnimation.dart';

class ButtonImplementation extends StatefulWidget {
  final int delayedTime;
  final String buttonText;
  final VoidCallback onTap;

  const ButtonImplementation(
      {Key? key,
      required this.delayedTime,
      required this.buttonText,
      required this.onTap})
      : super(key: key);

  @override
  State<ButtonImplementation> createState() => _ButtonImplementationState();
}

class _ButtonImplementationState extends State<ButtonImplementation> {
  @override
  Widget build(BuildContext context) {
    bool isPressed = false;
    double _scale = 0.986;

    void onPressedUp(PointerUpEvent event) {
      setState(() {
        isPressed = false;
      });
    }

    void onPressedDown(PointerDownEvent event) {
      setState(() {
        isPressed = true;
      });
    }

    return ButtonAnimation(
      delayAnimation: widget.delayedTime,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Listener(
          onPointerUp: onPressedUp,
          onPointerDown: onPressedDown,
          child: isPressed
              ? Transform.scale(
                  scale: _scale,
                  child: Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 3.0,
                          offset: Offset(0, 4),
                        ),
                      ],
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        widget.buttonText,
                        style: GoogleFonts.acme(fontSize: 20),
                      ),
                    ),
                  ),
                )
              : Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                        offset: Offset(0, 10),
                      ),
                    ],
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      widget.buttonText,
                      style: GoogleFonts.acme(fontSize: 20),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
