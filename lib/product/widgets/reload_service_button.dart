import 'package:flutter/material.dart';
import 'package:passit/core/states/app_colors/app_colors.dart';

import '../../core/states/app_fonts/app_fonts_panel.dart';
import 'sized_button/sized_button.dart';

class ReloadServiceButton extends StatelessWidget {
  final dynamic Function() onPressed;
  const ReloadServiceButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedButton(
      width: 150,
      height: 60,
      onPressed: () {
        onPressed();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Reload Service", style: AppFontsPanel.textStyle),
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.repeat,
            color: AppColors.text,
          )
        ],
      ),
    );
  }
}
