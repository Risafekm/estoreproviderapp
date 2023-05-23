import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomProfile extends StatelessWidget {
  const BottomProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        primary: true,
        automaticallyImplyLeading: false,
        // centerTitle: true,
        toolbarHeight: 55,
        elevation: 0,
        backgroundColor: Colors.black,
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            'Account',
            style: GoogleFonts.lora(
              textStyle: const TextStyle(
                fontSize: 24,
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              profilepicAndEdit(),
              const SizedBox(
                height: 50,
              ),
              nameAndEmail(context),
              const SizedBox(
                height: 20,
              ),
              editButton(context),
              const SizedBox(
                height: 20,
              ),
              const Divider(),
              const SizedBox(
                height: 2,
              ),
              ProfileOptions(
                iconLeading: Icons.payment,
                name: 'Payments',
                color: const Color.fromARGB(255, 141, 34, 228),
                colortrailing: const Color.fromARGB(255, 141, 34, 228),
                colorleading: const Color.fromARGB(255, 141, 34, 228),
                onPress: () {},
              ),
              const SizedBox(
                height: 2,
              ),
              ProfileOptions(
                iconLeading: Icons.delivery_dining,
                name: 'My Orders',
                color: const Color.fromARGB(255, 141, 34, 228),
                colortrailing: const Color.fromARGB(255, 141, 34, 228),
                colorleading: const Color.fromARGB(255, 141, 34, 228),
                onPress: () {},
              ),
              const SizedBox(
                height: 2,
              ),
              ProfileOptions(
                iconLeading: Icons.notifications,
                name: 'Notifications',
                color: const Color.fromARGB(255, 141, 34, 228),
                colortrailing: const Color.fromARGB(255, 141, 34, 228),
                colorleading: const Color.fromARGB(255, 141, 34, 228),
                onPress: () {},
              ),
              const SizedBox(
                height: 2,
              ),
              ProfileOptions(
                iconLeading: Icons.settings,
                name: 'Settings',
                color: const Color.fromARGB(255, 141, 34, 228),
                colortrailing: const Color.fromARGB(255, 141, 34, 228),
                colorleading: const Color.fromARGB(255, 141, 34, 228),
                onPress: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(),
              ProfileOptions(
                iconLeading: Icons.phone_android,
                color: const Color.fromARGB(255, 141, 34, 228),
                colortrailing: const Color.fromARGB(255, 141, 34, 228),
                colorleading: const Color.fromARGB(255, 141, 34, 228),
                name: 'About',
                onPress: () {},
              ),
              const SizedBox(
                height: 2,
              ),
              ProfileOptions(
                iconLeading: Icons.logout,
                name: 'LogOut',
                color: Colors.red,
                colorleading: Colors.red,
                colortrailing: Colors.red,
                onPress: () {
                  // Navigator.pushReplacement(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const SignInPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget profilepicAndEdit() {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 200,
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                  'https://akm-img-a-in.tosshub.com/indiatoday/images/story/202209/305487416_191058916633862_1245_1200x768.jpeg?VersionId=rsPH731Lvu36dA2fimFaehFotD2lp5Xt'),
            ),
          ),
        ),
        Positioned(
          bottom: -40,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              SizedBox(
                height: 110,
                width: 110,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    'https://www.filmibeat.com/ph-big/2020/01/mammootty_1579675009200.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 1,
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: const Icon(Icons.edit),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
    ;
  }

  Widget nameAndEmail(BuildContext context) {
    var Istheme = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Column(
      children: [
        Text(
          'Mammootty',
          style: GoogleFonts.actor(
            textStyle: TextStyle(
              fontSize: 20,
              color: Istheme ? Colors.white : Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          'mammootty98@gmail.com',
          style: GoogleFonts.adamina(
            textStyle: TextStyle(
              fontSize: 14,
              color: Istheme ? Colors.white : Colors.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }

  Widget editButton(BuildContext context) {
    var Istheme = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return GestureDetector(
      onTap: () {
        // Navigator.of(context).push(FadePageRouteAnimation(
        //     widget: const EditScreen(),
        //     curves: Curves.decelerate,
        //     animationTime: const Duration(milliseconds: 500)));
      },
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.amber,
        ),
        child: const Text(
          'Edit Profile',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ProfileOptions extends StatelessWidget {
  IconData iconLeading;
  String name;
  VoidCallback onPress;
  Color color;
  Color colorleading;
  Color colortrailing;

  ProfileOptions({
    Key? key,
    required this.iconLeading,
    required this.name,
    required this.color,
    required this.colorleading,
    required this.colortrailing,
    required this.onPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 10),
      child: ListTile(
        onTap: onPress,
        leading: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color.fromARGB(255, 48, 48, 48),
            ),
            child: Icon(
              iconLeading,
              size: 28,
              color: Colors.amber,
            )),
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            name,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.black,
            ),
          ),
        ),
        trailing: Container(
          height: 34,
          width: 34,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: const Color.fromARGB(255, 48, 48, 48)),
          child: Icon(
            Icons.arrow_forward_ios,
            color: Colors.amber.shade600,
            size: 20,
          ),
        ),
      ),
    );
  }
}
