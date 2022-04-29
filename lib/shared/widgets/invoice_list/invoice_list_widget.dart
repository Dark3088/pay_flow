import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/invoice_model/invoice_model.dart';
import 'package:pay_flow/shared/widgets/invoice_list/invoice_list_controller.dart';
import 'package:pay_flow/shared/widgets/invoice_tile/invoice_tile.dart';

class InvoiceListWidget extends StatefulWidget {
  const InvoiceListWidget({Key? key}) : super(key: key);

  @override
  State<InvoiceListWidget> createState() => _InvoiceListWidgetState();
}

class _InvoiceListWidgetState extends State<InvoiceListWidget> {
  final invoiceListController = InvoiceListController();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<InvoiceModel>>(
      valueListenable: invoiceListController.invoiceValueNotifier,
      builder: (_, invoices, __) => Column(
          children: invoices.map((e) => InvoiceTileWidget(data: e)).toList()),
    );
  }
}
