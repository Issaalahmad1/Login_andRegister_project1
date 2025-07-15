// ignore_for_file: unused_element, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_and_register_screen/component/my_button.dart';
import 'package:login_and_register_screen/responsive_screens.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveScreens(
      Mobile: MobilLoginrScreen(),
      Tablet: TabletLoginScreen(),
      Desktop: DesktopLoginScreen(),
    );
  }
}

//Mobile Login Screen
class MobilLoginrScreen extends StatefulWidget {
  const MobilLoginrScreen({super.key});

  @override
  State<MobilLoginrScreen> createState() => _MobilLoginrScreenState();
}

class _MobilLoginrScreenState extends State<MobilLoginrScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _hasTypedEmail = false;
  // ignore: unused_field
  bool _hasTypedPassword = true;
  bool _obscuretext = true;
  // من اجل جعل عناصر الخفلفية فوق الفورم تختفي عند عمل فوكس

  void _toggleVisibility() {
    setState(() {
      _obscuretext = !_obscuretext; // قلب الحالة
    });
  }

  // دالة التحقق من البريد
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter a valid email address.";
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return "Invalid email";
    }
    return null;
  }

  // دالة التحقق من كلمة المرور
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return "الرجاء إدخال كلمة المرور";
    if (value.length < 6) return "كلمة المرور قصيرة جدًا";
    return null;
  }

  // فحص مباشر أثناء الكتابة
  void _onEmailChanged(String value) {
    setState(() {
      _hasTypedEmail = true;
      _isEmailValid = _validateEmail(value) == null;
    });
  }

  void _onPasswordChanged(String value) {
    setState(() {
      _hasTypedPassword = true;
      _isPasswordValid = _validatePassword(value) == null;
    });
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // إذا كانت البيانات صحيحة
      // ignore: duplicate_ignore
      // ignore: avoid_print
      print("بريد إلكتروني: ${_emailController.text}");
      print("كلمة المرور: ${_passwordController.text}");
    } else {
      // إذا كانت هناك أخطاء
      print("النموذج يحتوي على أخطاء");
    }
  }

  @override
  Widget build(BuildContext context) {
    final _sizeScreen = MediaQuery.of(context).size.width >= 375;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: 620,
                  color: Color(0xffF6DC00),
                  child: Stack(
                    children: [
                      Positioned(
                        top: -2,
                        child: SizedBox(
                          child: Opacity(
                            opacity: 0.62,
                            child: SvgPicture.asset(
                              "assets/component/Component_login_screen.svg",
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 131,
                        left: 32,
                        child: SizedBox(
                          width: 650,
                          child: Text(
                            "Welcome\nBack!",
                            style: TextStyle(fontFamily: "Inter", fontSize: 32),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 64,
                        left: 20,

                        child: SizedBox(
                          width: 20,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_ios_new),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 340,
                        child: SizedBox(
                          height: 466,
                          child: SvgPicture.asset(
                            "assets/component/white_container_login_screen.svg",
                            width: _sizeScreen ? 650 : 375,
                            fit: _sizeScreen ? BoxFit.cover : BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(height: 150, color: Colors.white),
              ],
            ),

            Positioned(
              top: 400,
              right: 0,
              left: 0,
              child: SafeArea(
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Montserrat",
                            ),
                            controller: _emailController,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                top: 10,
                                bottom: 12,
                              ),
                              hintText: "Email",
                              hintStyle: TextStyle(color: Colors.black),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: _isEmailValid
                                      ? Color(0xffF6DC00)
                                      : Colors.redAccent,
                                  width: 2,
                                ),
                              ),
                              suffixIcon: _hasTypedEmail
                                  ? Icon(
                                      _isEmailValid
                                          ? Icons.check
                                          : Icons.error_outline_rounded,
                                      color: _isEmailValid
                                          ? Color(0xffF6DC00)
                                          : Colors.redAccent,
                                    )
                                  : null,
                              prefixIconConstraints: BoxConstraints(
                                maxHeight: 60,
                                maxWidth: 60,
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 13),
                                child: const Icon(
                                  Icons.email_outlined,
                                  size: 26,
                                  color: Colors.black,
                                ),
                              ),
                              isDense: true,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffF6DC00),
                                ),
                              ),
                            ),
                            validator: _validateEmail,
                            onChanged: _onEmailChanged,
                          ),
                        ),
                        SizedBox(height: 30),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: TextFormField(
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              fontFamily: "Montserrat",
                            ),
                            controller: _passwordController,
                            obscureText: _obscuretext,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(
                                top: 10,
                                bottom: 12,
                              ),
                              hintText: "Password",
                              hintStyle: TextStyle(color: Colors.black),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: _isPasswordValid
                                      ? Color(0xffF6DC00)
                                      : Colors.redAccent,
                                  width: 2,
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: _toggleVisibility,
                                child: Icon(
                                  _obscuretext
                                      ? Icons.visibility_off_outlined
                                      : Icons.visibility_outlined,
                                  color: Colors.black,
                                ),
                              ),

                              prefixIconConstraints: BoxConstraints(
                                maxHeight: 60,
                                maxWidth: 60,
                              ),
                              prefixIcon: Padding(
                                padding: const EdgeInsets.only(right: 13),
                                child: const Icon(
                                  Icons.lock_outline_rounded,
                                  size: 26,
                                  color: Colors.black,
                                ),
                              ),
                              isDense: true,
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xffF6DC00),
                                ),
                              ),
                            ),
                            validator: _validatePassword,
                            onChanged: _onPasswordChanged,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, right: 27),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [Text("Forgot password?")],
                          ),
                        ),
                        SizedBox(height: 20),
                        MyButton(
                          Titlebutton: "Log in",
                          FillColorButton: Color(0xffF6DC00),
                          onpressed: () {},
                        ),
                        SizedBox(height: 8),
                        Padding(
                          padding: EdgeInsetsGeometry.symmetric(horizontal: 22),
                          child: Row(
                            children: [
                              Expanded(child: Divider(thickness: 1)),
                              Text(" or "),
                              Expanded(child: Divider(thickness: 1)),
                            ],
                          ),
                        ),
                        SizedBox(height: 8),
                        MyButton(
                          Titlebutton: "Sign up",
                          FillColorButton: Colors.white,
                          onpressed: () {
                            Navigator.of(
                              context,
                            ).pushReplacementNamed("RegisterScreen");
                          },
                        ),
                      ],
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

//Tablet Login Screen
class TabletLoginScreen extends StatelessWidget {
  const TabletLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

//Desktop Login Screen
class DesktopLoginScreen extends StatelessWidget {
  const DesktopLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
