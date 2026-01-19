import 'package:credpal_ui_test/core/constants/app_spacing.dart';
import 'package:credpal_ui_test/data/merchant_list.dart';
import 'package:credpal_ui_test/presentation/widgets/merchant_card.dart';
import 'package:flutter/material.dart';

class MerchantsGrid extends StatelessWidget {
  const MerchantsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.horizontalSpacing),
      child: GridView.count(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        crossAxisCount: 4,
        mainAxisSpacing: AppSpacing.verticalValueMedium,
        crossAxisSpacing: AppSpacing.horizontalSpacing,
        childAspectRatio: 0.6,
        children: merchants
            .map((merchant) => MerchantCard(merchant: merchant))
            .toList(),
      ),
    );
  }
}
