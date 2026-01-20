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
      child: LayoutBuilder(
        builder: (context, constraints) {
          int crossAxisCount;
          double childAspectRatio;
          if (constraints.maxWidth >= 1200) {
            crossAxisCount = 6;
            childAspectRatio = 2;
          } else if (constraints.maxWidth >= 800) {
            crossAxisCount = 4;
            childAspectRatio = 0.9;
          } else {
            crossAxisCount = 4;
            childAspectRatio = 0.6;
          }

          return GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: crossAxisCount,
            mainAxisSpacing: AppSpacing.verticalValueMedium,
            crossAxisSpacing: AppSpacing.horizontalSpacing,
            childAspectRatio: childAspectRatio,
            children: merchants
                .map((merchant) => MerchantCard(merchant: merchant))
                .toList(),
          );
        },
      ),
    );
  }
}
