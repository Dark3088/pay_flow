import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/buttons_set/buttons_set_label.dart';

class BottomSheetWidget extends StatelessWidget {
  final primaryLabel;
  final secondaryLabel;

  final VoidCallback primaryOnTap;
  final VoidCallback secondaryOnTap;

  final String title;
  final String subTitle;

  const BottomSheetWidget({
    Key? key,
    required this.primaryLabel,
    required this.secondaryLabel,
    required this.primaryOnTap,
    required this.secondaryOnTap,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: RotatedBox(
        quarterTurns: 1,
        child: Material(
          child: Container(
            color: AppColors.shape,
            child: Column(
              children: [
                Expanded(
                    child: Container(
                  color: Colors.black.withOpacity(0.6),
                )),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(40),
                      child: Text.rich(
                          TextSpan(
                              text: title,
                              style: TextStyles.buttonBoldHeading,
                              children: [
                                TextSpan(
                                  text: "\n$subTitle",
                                  style: TextStyles.buttonHeading,
                                )
                              ]),
                          textAlign: TextAlign.center),
                    ),
                    Container(
                      height: 1,
                      color: AppColors.stroke,
                    ),
                    ButtonsSetLabel(
                        enablePrimaryColor: true,
                        primaryLabel: primaryLabel,
                        secondaryLabel: secondaryLabel,
                        primaryOnTap: primaryOnTap,
                        secondaryOnTap: secondaryOnTap)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
