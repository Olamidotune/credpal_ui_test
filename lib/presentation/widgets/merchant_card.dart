import 'package:credpal_ui_test/core/constants/app_colors.dart';
import 'package:credpal_ui_test/core/constants/text_styles.dart';
import 'package:credpal_ui_test/models/merchant.dart';
import 'package:flutter/material.dart';

class MerchantCard extends StatelessWidget {
  final Merchant merchant;

  const MerchantCard({super.key, required this.merchant});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            color: merchant.backgroundColor,
            shape: BoxShape.circle,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: merchant.logoPath != null
                ? Image.asset(merchant.logoPath!)
                : Center(
                    child: Text(
                      merchant.name,
                      textAlign: TextAlign.center,
                      style: TextStyles.bodyTextBold.copyWith(
                        color: merchant.merchantTextColor,
                        fontSize: 10,
                      ),
                    ),
                  ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          merchant.name,
          style: TextStyles.caption.copyWith(color: AppColors.blackColor),
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
