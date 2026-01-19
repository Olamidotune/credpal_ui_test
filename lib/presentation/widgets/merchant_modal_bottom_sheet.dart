import 'package:credpal_ui_test/core/constants/app_colors.dart';
import 'package:credpal_ui_test/core/constants/app_spacing.dart';
import 'package:credpal_ui_test/data/merchant_list.dart';
import 'package:credpal_ui_test/presentation/widgets/merchant_card.dart';
import 'package:flutter/material.dart';

class MerchantsModalBottomSheet extends StatelessWidget {
  const MerchantsModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.horizontalSpacing),
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
            AppSpacing.verticalSpaceLarge,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: merchants
                  .take(4)
                  .map((merchant) => MerchantCard(merchant: merchant))
                  .toList(),
            ),
            AppSpacing.verticalSpaceMedium,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: merchants
                  .skip(4)
                  .take(4)
                  .map((merchant) => MerchantCard(merchant: merchant))
                  .toList(),
            ),
            AppSpacing.verticalSpaceMedium,
            Row(
              children: List.generate(4, (index) {
                if (index < 2) {
                  return Expanded(
                    child: MerchantCard(merchant: merchants[8 + index]),
                  );
                }
                return const Expanded(child: SizedBox());
              }),
            ),
          ],
        ),
      ),
    );
  }
}
