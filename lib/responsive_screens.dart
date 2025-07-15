import 'package:flutter/material.dart';

class ResponsiveScreens extends StatelessWidget {
  final Widget? Mobile;
  final Widget? Tablet;
  final Widget? Desktop;

  const ResponsiveScreens({
    super.key,
    this.Mobile,
    this.Tablet,
    this.Desktop,
    t,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    if (size.width >= 1100 && Desktop != null) {
      return Desktop!;
    } else if (size.width >= 650 && Tablet != null) {
      return Tablet!;
    } else {
      return Mobile!;
    }
  }
}
