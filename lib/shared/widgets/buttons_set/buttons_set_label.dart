import 'package:flutter/material.dart';
import 'package:pay_flow/shared/widgets/divider_vertical/divider_vertical_widget.dart';
import 'package:pay_flow/shared/widgets/label_button/label_button.dart';

class ButtonsSetLabel extends StatelessWidget {
  final String primaryLabel;
  final String secondaryLabel;

  final VoidCallback primaryOnTap;
  final VoidCallback secondaryOnTap;

  const ButtonsSetLabel(
      {Key? key,
      required this.primaryLabel,
      required this.secondaryLabel,
      required this.primaryOnTap,
      required this.secondaryOnTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      child: Row(
        children: [
          Expanded(
              child: LabelButton(label: primaryLabel, onTap: primaryOnTap)),
          DividerVerticalWidget(),
          Expanded(
              child:
                  LabelButton(label: secondaryLabel, onTap: secondaryOnTap)),
        ],
      ),
    );
  }
}
