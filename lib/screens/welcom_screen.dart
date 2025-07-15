import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_and_register_screen/responsive_screens.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScreens(
      Mobile: MobileWelcomescreen(),
      Tablet: TebletWelcomescreen(),
      Desktop: DesktopWelcomescreen(),
    );
  }
}

//Mobile Screen
class MobileWelcomescreen extends StatelessWidget {
  const MobileWelcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6DC00),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 450,
                  width: 500,
                  child: Opacity(
                    opacity: 0.55,
                    child: SvgPicture.asset(
                      "assets/component/component_welcome_screen.svg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 37,
                  left: 29,
                  child: Container(
                    height: 149.83,
                    width: 149.83,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(75),
                      color: Color.fromRGBO(246, 220, 0, 1.001),
                    ),
                  ),
                ),
                Positioned(
                  top: 62,
                  left: 65,
                  child: Text(
                    "ITE",
                    style: TextStyle(
                      fontSize: 40,
                      fontFamily: "PlayfairDisplay",
                      color: const Color.fromRGBO(5, 6, 7, 1),
                    ),
                  ),
                ),
                Positioned(
                  top: 110,
                  left: 53,
                  child: Text(
                    "Issa Alahmad",
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: "PlayfairDisplay",
                      color: const Color.fromRGBO(5, 6, 7, 1),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: const Text(
                "UIX University",
                style: TextStyle(
                  fontFamily: "Inter",
                  fontWeight: FontWeight.w600,
                  fontSize: 24,
                  color: Color(0xff050607),
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 40.0),
              child: const Text(
                "We deliver easy and simple UI /\n UX Videos ",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 14,
                  color: Color(0xff050607),
                ),
              ),
            ),
            SizedBox(height: 60),
            Center(
              child: SizedBox(
                width: 311,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                    elevation: 1.0,
                    backgroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed("LoginScreen");
                  },
                  child: Text(
                    "Log in",
                    style: TextStyle(
                      color: Color(0xff050607),
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: SizedBox(
                width: 311,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(8),
                    ),
                    elevation: 1.0,
                    backgroundColor: const Color.fromRGBO(5, 6, 7, 1),
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed("RegisterScreen");
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: Color(0xffF6DC00),
                      fontFamily: "Inter",
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Tablet Screen
class TebletWelcomescreen extends StatelessWidget {
  const TebletWelcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

//Desktop Screen
class DesktopWelcomescreen extends StatelessWidget {
  const DesktopWelcomescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
