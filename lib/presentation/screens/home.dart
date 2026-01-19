import 'package:credpal_ui_test/core/constants/app_colors.dart';
import 'package:credpal_ui_test/core/theme/text_styles.dart';
import 'package:credpal_ui_test/presentation/widgets/button.dart';
import 'package:flutter/material.dart';

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
                const Button(),
              ],
            ),
          ],
        ),

        toolbarHeight: 140,
      ),
    );
  }
}
