import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/divider_vertical/divider_vertical_widget.dart';
import 'package:pay_flow/shared/widgets/label_button/label_button.dart';

class ButtonsSetLabel extends StatelessWidget {
  final String primaryLabel;
  final String secondaryLabel;

  final VoidCallback primaryOnTap;
  final VoidCallback secondaryOnTap;

  final bool enablePrimaryColor;
  final bool enableSecondaryColor;

  const ButtonsSetLabel(
      {Key? key,
      required this.primaryLabel,
      required this.secondaryLabel,
      required this.primaryOnTap,
      required this.secondaryOnTap,
      this.enablePrimaryColor = false,
      this.enableSecondaryColor = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      height: 57,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            height: 1,
            thickness: 1,
            color: AppColors.stroke,
          ),
          Container(
            height: 56,
            child: Row(
              children: [
                Expanded(
                    child: LabelButton(
                        label: primaryLabel,
                        onTap: primaryOnTap,
                        style: enablePrimaryColor
                            ? TextStyles.buttonPrimary
                            : null)),
                DividerVerticalWidget(),
                Expanded(
                    child: LabelButton(
                        label: secondaryLabel, onTap: secondaryOnTap,
                        style: enableSecondaryColor
                            ? TextStyles.buttonPrimary
                            : null)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
