import 'package:credpal_ui_test/core/constants/app_colors.dart';
import 'package:credpal_ui_test/core/constants/app_spacing.dart';
import 'package:credpal_ui_test/core/theme/text_styles.dart';
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
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: AppSpacing.horizontalSpacing,
            ),
            child: Column(
              children: [
                AppSpacing.verticalSpaceMedium,
                Row(
                  children: [
                    CustomSearchBar(),
                    AppSpacing.horizontalSpaceMedium,
                    ScanButton(),
                  ],
                ),
                AppSpacing.verticalSpaceMedium,
                Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  color: AppColors.secondaryColor,
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppColors.whiteColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Image.asset('assets/svg/this.png'),
                  ),
                ),
              ],
            ),
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
