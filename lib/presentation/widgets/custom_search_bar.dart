import 'package:credpal_ui_test/core/constants/app_colors.dart';
import 'package:credpal_ui_test/core/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
