import 'package:flutter/material.dart';

import '../base/app_colors.dart';
import '../base/app_ternary_clean.dart';

class AppButtonDefault extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;
  final bool isLoading;
  final bool usingJustPadding;
  final bool buttonDark;
  final bool isCompact;
  final double width;
  final Color? colorBackground;
  final Color? colorText;
  final double? elevation;

  const AppButtonDefault({
    super.key,
    required this.onPressed,
    required this.text,
    this.isCompact = false,
    this.isLoading = false,
    this.buttonDark = false,
    this.usingJustPadding = false,
    this.width = 250,
    this.colorBackground,
    this.colorText,
    this.elevation = 2,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: usingJustPadding ? null : width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: elevation,
          visualDensity: ternaryClean(
            condition: isCompact,
            caseTrue: VisualDensity.compact,
            caseFalse: VisualDensity.adaptivePlatformDensity,
          ),
          padding: EdgeInsets.symmetric(
            horizontal: usingJustPadding ? 15 : 0,
            vertical: isCompact ? 0 : 10,
          ),
          backgroundColor: ternaryClean(
            condition: buttonDark,
            caseTrue: colorBackground ?? AppColors.primary,
            caseFalse: Colors.white,
          ),
        ),
        onPressed: isLoading ? null : onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isLoading)
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SizedBox(
                  height: 30,
                  width: 30,
                  child: CircularProgressIndicator.adaptive(
                    strokeWidth: 3.5,
                    backgroundColor: AppColors.primary.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation(AppColors.primary),
                  ),
                ),
              ),
            Text(
              text,
              style: TextStyle(
                color:
                    buttonDark ? colorText ?? Colors.black : AppColors.primary,
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
