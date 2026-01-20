import 'package:credpal_ui_test/core/constants/app_colors.dart';
import 'package:credpal_ui_test/core/constants/text_styles.dart';
import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(AppColors.primaryColor),
        padding: WidgetStateProperty.all<EdgeInsets>(const EdgeInsets.all(10)),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(3.0)),
          ),
        ),
      ),
      onPressed: () {},
      child: Text('Activate Credit', style: TextStyles.buttonText),
    );
  }
}
