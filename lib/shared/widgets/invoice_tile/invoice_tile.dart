import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/invoice_model/invoice_model.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';

class InvoiceTileWidget extends StatelessWidget {
  final InvoiceModel data;
  const InvoiceTileWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(data.name.toString(), style: TextStyles.titleListTile),
      subtitle: Text("Vence em ${data.dueDate}", style: TextStyles.captionBody),
      trailing: Text.rich(
          TextSpan(text: "R\$ ", style: TextStyles.titleRegular, children: [
        TextSpan(
            text: "${data.value!.toStringAsFixed(2)}",
            style: TextStyles.trailingBold)
      ])),
    );
  }
}