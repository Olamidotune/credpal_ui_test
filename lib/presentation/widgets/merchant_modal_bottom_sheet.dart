import 'package:credpal_ui_test/core/constants/app_colors.dart';
import 'package:credpal_ui_test/core/constants/app_spacing.dart';
import 'package:credpal_ui_test/presentation/screens/home.dart';
import 'package:flutter/material.dart';

class MerchantsModalBottomSheet extends StatelessWidget {
  const MerchantsModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,

      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            AppSpacing.verticalSpaceMedium,
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 12),
                height: 4,
                width: 40,
                decoration: BoxDecoration(
                  color: AppColors.blackColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            AppSpacing.verticalSpaceMedium,
            MerchantsGrid(),
          ],
        ),
      ),
    );
  }
}
