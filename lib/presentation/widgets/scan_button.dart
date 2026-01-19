import 'package:credpal_ui_test/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ScanButton extends StatelessWidget {
  const ScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.secondaryColor.withValues(alpha: .3),
        borderRadius: BorderRadius.circular(12),
      ),

      child: SvgPicture.asset('assets/svg/scan.svg'),
    );
  }
}
