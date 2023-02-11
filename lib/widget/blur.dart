import 'dart:ui';
import 'package:flutter/material.dart';

class BlurContainer extends StatelessWidget {
  const BlurContainer({
    Key? key,
    this.child,
    this.height,
    this.width,
  }) : super(key: key);
  final double? height;
  final double? width;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 0.1, sigmaY: 0.1),
        child: Container(
          clipBehavior: Clip.none,
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.1),
            border: Border.all(
              color: Colors.white.withOpacity(0.2),
              width: 1.5,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.center,
          child: child,
        ),
      ),
    );
  }
}
