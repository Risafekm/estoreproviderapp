import 'package:flutter/material.dart';
import '../../Animations/PageRouteAnimations/PageRouteAnimaton.dart';
import '../../Animations/UiAnimations/FadeAnimation.dart';
import '../SIgnIn/SignIn.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    delayHome();
  }

  void delayHome() async {
    await Future.delayed(const Duration(milliseconds: 1400), () {});
    // ignore: use_build_context_synchronously
    Navigator.of(context).pushReplacement(PageRouteAnimation(
        widget: const SignInPage(),
        alignment: Alignment.bottomCenter,
        curves: Curves.decelerate,
        animationTime: const Duration(milliseconds: 1100)));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Color.fromARGB(59, 109, 196, 195),
            ],
          ),
        ),
        child: Center(
          child: FadeAnimation(
              child: Image.asset(
            'assets/logo/logo.png',
            scale: 0.3,
          )),
        ),
      ),
    );
  }
}
