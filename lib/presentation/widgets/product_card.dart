import 'package:credpal_ui_test/core/constants/app_colors.dart';
import 'package:credpal_ui_test/core/constants/app_spacing.dart';
import 'package:credpal_ui_test/core/constants/text_styles.dart';
import 'package:credpal_ui_test/models/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
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
                  style: TextStyles.caption.copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                AppSpacing.horizontalSpaceSmall,
                Text(
                  '₦ ${product.discountedPrice}',
                  style: TextStyles.caption.copyWith(
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
