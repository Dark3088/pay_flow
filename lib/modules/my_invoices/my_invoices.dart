import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/invoice_list/invoice_list_widget.dart';

class MyInvoices extends StatefulWidget {
  const MyInvoices({Key? key}) : super(key: key);

  @override
  State<MyInvoices> createState() => _MyInvoicesState();
}

class _MyInvoicesState extends State<MyInvoices> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Row(
            children: [
              Text("Meus boletos", style: TextStyles.titleBoldHeading),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Divider(
              thickness: 1,
              height: 1,
              color: AppColors.stroke,
            )),
        InvoiceListWidget()
      ],
    );
  }
}
