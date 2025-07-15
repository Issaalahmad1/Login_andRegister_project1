import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String Titlebutton;
  final Color FillColorButton;
  final VoidCallback onpressed;
  const MyButton({
    super.key,
    required this.Titlebutton,
    required this.FillColorButton,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 311,
        height: 48,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(8),
              side: BorderSide(color: const Color(0xffF6DC00)),
            ),
            elevation: 0.0,
            backgroundColor: FillColorButton,
          ),
          onPressed: onpressed,
          child: Text(
            Titlebutton,
            style: TextStyle(
              color: Color.fromRGBO(5, 6, 7, 1),
              fontFamily: "Inter",
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }
}
