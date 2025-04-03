import 'package:flutter/material.dart';

class ResponsiveCustomWrapper extends StatelessWidget {
  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ResponsiveCustomWrapper({
    Key? key,
    required this.mobile,
    this.tablet,
    this.desktop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    if (size.width >= 1200 && desktop != null) {
      return desktop!;
    }

    if (size.width >= 800 && tablet != null) {
      return tablet!;
    }

    return mobile;
  }
}