import 'package:flutter/material.dart';

import '../base/app_colors.dart';

class AppCardWidget extends StatelessWidget {
  final Widget child;
  final double? width;
  final double? height;
  final List<BoxShadow>? shadows;
  final Color backgroudColor;
  final EdgeInsetsGeometry? padding;

  const AppCardWidget({
    required this.child,
    this.width,
    this.height,
    this.shadows,
    this.backgroudColor = Colors.white,
    this.padding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: backgroudColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: shadows ??
            [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.03),
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
      ),
      child: child,
    );
  }
}
