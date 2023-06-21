import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../../Animations/PageRouteAnimations/loginPageAnimation.dart';
import '../../Animations/UiAnimations/ScaleAnimation.dart';
import '../MainScreen.dart';
import '../Widgets/widget.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  ValueNotifier<bool> visibility = ValueNotifier<bool>(true);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  // validation() {
  //   if (formKey.currentState!.validate()) {
  //     return Navigator.of(context).push(
  //       PageRouteBuilder(
  //         pageBuilder: ((BuildContext context, Animation<double> animation,
  //             Animation<double> secondaryAnimation) {
  //           return const BottomBarPages();
  //         }),
  //         transitionDuration: const Duration(seconds: 2),
  //         transitionsBuilder: (BuildContext context,
  //             Animation<double> animation,
  //             Animation<double> secondaryAnimation,
  //             Widget child) {
  //           return ScaleTransition(
  //             child: child,
  //             scale: animation,
  //           );
  //         },
  //       ),
  //     );
  //   } else {
  //     return Text("Not Validate");
  //   }
  // }

  //SignIn Function

  // Future LoginUser(String email, String password, context) async {
  //   ProviderState providerState =
  //       Provider.of<ProviderState>(context, listen: false);
  //   try {
  //     if (await providerState.LoginUser(email, password)) {
  //       Navigator.of(context)
  //           .push(MaterialPageRoute(builder: (context) => MainScreen()));
  //       print('navigated');
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 150, 207, 233),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Form(
          key: formKey,
          child: Stack(
            //Stack Starting
            clipBehavior: Clip.none,
            children: [
              backGroundImageSlide(),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  //Column Starting
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 80),
                    DelayedAnimation(
                      aniDuration: 900,
                      aniOffsetX: 0.0,
                      aniOffsetY: 1.0,
                      delayedAnimation: 800,
                      child: welcome(),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Center(
                      child: DelayedAnimation(
                        aniDuration: 900,
                        aniOffsetX: 0.0,
                        aniOffsetY: 0.35,
                        delayedAnimation: 1000,
                        child: subTitle(),
                      ),
                    ),
                    const SizedBox(
                      height: 270,
                      width: 300,
                    ),
                    DelayedAnimation(
                      aniDuration: 800,
                      aniOffsetX: 0.0,
                      aniOffsetY: 0.45,
                      delayedAnimation: 900,
                      child: emailField(),
                    ),
                    const SizedBox(height: 20),
                    DelayedAnimation(
                      aniDuration: 700,
                      aniOffsetX: 0.0,
                      aniOffsetY: 0.25,
                      delayedAnimation: 900,
                      child: passwordField(),
                    ),
                    const SizedBox(height: 25),
                    DelayedAnimation(
                      aniDuration: 500,
                      aniOffsetX: 0.0,
                      aniOffsetY: 0.35,
                      delayedAnimation: 900,
                      child: loginButton(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    DelayedAnimation(
                      aniDuration: 500,
                      aniOffsetX: 0.0,
                      aniOffsetY: 0.35,
                      delayedAnimation: 900,
                      child: socialMediaIcons(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget socialMediaIcons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ScaleAnimation(
          delayTime: 800,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.purple,
                      Colors.pink,
                      Colors.orange,
                    ],
                  ),
                  borderRadius: BorderRadius.circular(100)),
              child: const Icon(
                MdiIcons.instagram,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        ScaleAnimation(
          delayTime: 800,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
              child: const Icon(
                MdiIcons.twitter,
                color: Colors.blue,
                size: 28,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        ScaleAnimation(
          delayTime: 800,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              clipBehavior: Clip.none,
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: const Icon(
                MdiIcons.google,
                color: Colors.green,
                size: 28,
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        ScaleAnimation(
          delayTime: 800,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
              child: const Icon(
                MdiIcons.facebook,
                color: Colors.blue,
                size: 28,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget loginButton() {
    return SizedBox(
      height: 50,
      width: 250,
      child: ElevatedButton(
          onPressed: () {
            print('clicked');
            // LoginUser(emailController.text, passwordController.text, context);
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => MainScreen()));
          },
          style: elevatedButtonStyle(),
          child: Text(
            'Login',
            style: GoogleFonts.crimsonText(
                fontSize: 22, fontWeight: FontWeight.bold),
          )),
    );
  }

  Widget emailField() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        validator: MultiValidator([
          RequiredValidator(errorText: "required"),
          EmailValidator(errorText: "not a valid email"),
        ]),
        style: formFieldStyle(),
        onChanged: (val) {
          setState(() {
            email = val;
          });
        },
        decoration: textInputDecoration1(
          hintText: 'Email',
          prefixIcon: const Icon(
            Icons.email,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget passwordField() {
    return Padding(
      padding: const EdgeInsets.only(left: 8, right: 8),
      child: ValueListenableBuilder(
        valueListenable: visibility,
        builder: (context, value, child) {
          return TextFormField(
            obscureText: visibility.value,
            controller: passwordController,
            validator: (val) {
              if (val!.length < 6) {
                return "weak password";
              } else {
                return null;
              }
            },
            style: formFieldStyle(),
            onChanged: (val) {
              setState(() {
                password = val;
              });
            },
            decoration: textInputDecoration(
              suffixIcon: GestureDetector(
                onTap: () {
                  visibility.value = !visibility.value;
                },
                child: visibility.value
                    ? const Icon(
                        Icons.visibility_off,
                        color: Colors.white,
                      )
                    : const Icon(
                        Icons.visibility,
                        color: Colors.white,
                      ),
              ),
              hintText: 'Password',
              prefixIcon: const Icon(
                Icons.key,
                color: Colors.white,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget subTitle() {
    return Text(
      'login now & Continue your shopping !!!',
      maxLines: 2,
      style: subHeadingCaption(),
    );
  }

  Widget welcome() {
    return Text(
      'WELCOME',
      style: headingCaptionStyle(),
    );
  }

  Widget backGroundImageSlide() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken),
          image: AssetImage(
            'assets/background/womensdress.webp',
          ),
          fit: BoxFit.fitHeight,
        ),
      ),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
    );
  }
}
