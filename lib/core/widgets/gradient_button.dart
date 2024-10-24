import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final void Function()? onPressed;
  final Widget child;

  const GradientButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Material(
        borderRadius: BorderRadius.circular(8),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xffe77622), Color(0xfff1af01)],
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Center(child: child),
        ),
      ),
    );
  }
}
