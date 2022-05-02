import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/invoice_model/invoice_model.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/invoice_info/invoice_info.dart';
import 'package:pay_flow/shared/widgets/invoice_list/invoice_list_controller.dart';
import 'package:pay_flow/shared/widgets/invoice_list/invoice_list_widget.dart';

class MyInvoicesPage extends StatefulWidget {
  const MyInvoicesPage({Key? key}) : super(key: key);

  @override
  State<MyInvoicesPage> createState() => _MyInvoicesPageState();
}

class _MyInvoicesPageState extends State<MyInvoicesPage> {
  final invoicelistController = InvoiceListController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              color: AppColors.primary,
              height: 40,
              width: double.maxFinite,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ValueListenableBuilder<List<InvoiceModel>>(
                  valueListenable: invoicelistController.invoiceValueNotifier,
                  builder: (_, invoices, __) =>
                      AnimatedCard(
                        direction: AnimatedCardDirection.top,
                        child: InvoiceInfoWidget(size: invoices.length))),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24, left: 24, right: 24),
          child: Row(
            children: [
              Text("Meus boletos", style: TextStyles.titleBoldHeading),
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
