import 'package:credpal_ui_test/core/constants/app_colors.dart';
import 'package:credpal_ui_test/core/constants/app_spacing.dart';
import 'package:credpal_ui_test/core/theme/text_styles.dart';
import 'package:credpal_ui_test/data/product_list.dart';
import 'package:credpal_ui_test/models/product.dart';
import 'package:credpal_ui_test/presentation/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondaryColor,
        centerTitle: false,
        shape: const RoundedRectangleBorder(),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Pay later \neverywhere', style: TextStyles.heading1),
            Icon(Icons.info_outline, color: AppColors.greyColor),
            Column(
              children: [
                Text('Shopping limit: 0', style: TextStyles.bodyText),
                AppSpacing.verticalSpaceSmall,
                const Button(),
              ],
            ),
          ],
        ),

        toolbarHeight: 140,
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
            ],
          ),
        ),
      ),
    );
  }
}

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

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SearchBar(
        leading: SvgPicture.asset(
          'assets/svg/search.svg',
          width: 18,
          height: 18,
        ),
        hintText: 'Search for products or stores',
        hintStyle: WidgetStateProperty.all(
          TextStyles.bodyText.copyWith(color: AppColors.greyColor),
        ),
        backgroundColor: WidgetStateProperty.all(
          AppColors.secondaryColor.withValues(alpha: .3),
        ),
        elevation: WidgetStateProperty.all(0),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: .2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              product.imagePath,
              height: 350,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 8,
            left: 4,
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.blackColor.withValues(alpha: .15),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: CircleAvatar(
                radius: 25,

                backgroundColor: Colors.white,
                child: SvgPicture.asset(product.badge, width: 30, height: 30),
              ),
            ),
          ),
          Positioned(
            bottom: 25,
            child: Text(
              product.name,
              style: TextStyles.bodyTextBold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Positioned(
            bottom: 2,
            child: Row(
              children: [
                Text(
                  '₦ ${product.price}',
                  style: TextStyles.bodyTextBold.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
                AppSpacing.horizontalSpaceMedium,
                Text(
                  '₦ ${product.discountedPrice}',
                  style: TextStyles.bodyText.copyWith(
                    color: AppColors.greyColor,
                    decoration: TextDecoration.lineThrough,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
