import 'package:credpal_ui_test/core/constants/app_colors.dart';
import 'package:credpal_ui_test/core/constants/app_spacing.dart';
import 'package:credpal_ui_test/core/theme/text_styles.dart';
import 'package:credpal_ui_test/data/merchant_list.dart';
import 'package:credpal_ui_test/data/product_list.dart';
import 'package:credpal_ui_test/presentation/widgets/button.dart';
import 'package:credpal_ui_test/presentation/widgets/custom_search_bar.dart';
import 'package:credpal_ui_test/presentation/widgets/merchant_card.dart';
import 'package:credpal_ui_test/presentation/widgets/merchant_modal_bottom_sheet.dart';
import 'package:credpal_ui_test/presentation/widgets/product_card.dart';
import 'package:credpal_ui_test/presentation/widgets/scan_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        centerTitle: false,
        toolbarHeight: 140,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: TextStyles.heading1,
                children: [
                  const TextSpan(text: 'Pay later \n'),
                  const TextSpan(text: 'everywhere'),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: SvgPicture.asset('assets/svg/info.svg'),
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Shopping limit: ₦0', style: TextStyles.bodyText),
                AppSpacing.verticalSpaceSmall,
                const Button(),
              ],
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              AppSpacing.verticalSpaceMedium,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.horizontalSpacing,
                ),
                child: Row(
                  children: [
                    CustomSearchBar(),
                    AppSpacing.horizontalSpaceMedium,
                    ScanButton(),
                  ],
                ),
              ),
              AppSpacing.verticalSpaceMedium,
              Container(
                height: MediaQuery.of(context).size.height * 0.47,
                color: AppColors.secondaryColor,
                child: Padding(
                  padding: EdgeInsets.all(AppSpacing.horizontalSpacing),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          separatorBuilder: (context, index) =>
                              AppSpacing.horizontalSpaceMedium,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return ProductCard(product: product);
                          },
                        ),
                      ),
                      AppSpacing.verticalSpaceMedium,
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: products.length,
                          separatorBuilder: (context, index) =>
                              AppSpacing.horizontalSpaceMedium,
                          itemBuilder: (context, index) {
                            final product = products[index];
                            return ProductCard(product: product);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              AppSpacing.verticalSpaceMassive,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.horizontalSpacing,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Featured Merchants',
                      style: TextStyles.bodyTextBold.copyWith(fontSize: 16),
                    ),
                    GestureDetector(
                      onTap: () => _showMerchantModalBottomSheet(context),
                      child: Text(
                        'View all',
                        style: TextStyles.bodyText.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              AppSpacing.verticalSpaceMedium,
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.horizontalSpacing,
                ),
                child: Column(
                  children: [
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
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _showMerchantModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (context) {
        return MerchantsModalBottomSheet();
      },
    );
  }
}
