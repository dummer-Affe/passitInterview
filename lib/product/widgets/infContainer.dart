import 'package:flutter/material.dart';

class InfContainer extends StatelessWidget {
  final Widget child;
  final Alignment alignment;
  final BoxDecoration? decoration;
  final EdgeInsetsGeometry? padding;
  const InfContainer(
      {super.key,
      required this.child,
      this.alignment = Alignment.center,
      this.decoration,
      this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      decoration: decoration,
      width: double.infinity,
      height: double.infinity,
      padding: padding,
      child: child,
    );
  }
}
