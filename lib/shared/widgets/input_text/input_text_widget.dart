import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';

class InputTextWidget extends StatelessWidget {
  final String label;
  final IconData icon;
  final String? initialValue;
  final String? Function(String?) ? validator;
  final TextEditingController? editingController;
  final void Function (String value) onChanged;

  const InputTextWidget({
    Key? key,
    required this.label,
    required this.icon,
    this.initialValue,
    this.validator,
    this.editingController,
    required this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          TextFormField(
            initialValue: initialValue,
            validator: validator,
            controller: editingController,
            onChanged: onChanged,
            style: TextStyles.input,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.zero,
                icon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        child: Icon(icon, color: AppColors.primary)),
                    Container(
                      width: 1,
                      height: 48,
                      color: AppColors.stroke,
                    )
                  ],
                ),
                border: InputBorder.none,
                labelText: label,
                labelStyle: TextStyles.input),
          ),
          Divider(
            thickness: 1,
            height: 1,
            color: AppColors.stroke,
          )
        ],
      ),
    );
  }
}