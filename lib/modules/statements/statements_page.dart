import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/invoice_list/invoice_list_controller.dart';
import 'package:pay_flow/shared/widgets/invoice_list/invoice_list_widget.dart';


class MyStatetmentsPage extends StatefulWidget {

  const MyStatetmentsPage({Key? key}) : super(key: key);

  @override
  State<MyStatetmentsPage> createState() => _MyStatetmentsPageState();

}

class _MyStatetmentsPageState extends State<MyStatetmentsPage> {

  final invoicelistController = InvoiceListController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Row(
            children: [
              Text("Meus extratos", style: TextStyles.titleBoldHeading),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            child: Divider(
              thickness: 1,
              height: 1,
              color: AppColors.stroke,
            )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child:
              InvoiceListWidget(invoiceListController: invoicelistController),
        )
      ],
    );
  }
}
