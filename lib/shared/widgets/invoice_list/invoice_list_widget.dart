import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/invoice_model/invoice_model.dart';
import 'package:pay_flow/shared/widgets/invoice_list/invoice_list_controller.dart';
import 'package:pay_flow/shared/widgets/invoice_tile/invoice_tile.dart';

class InvoiceListWidget extends StatefulWidget {

  final InvoiceListController invoiceListController;
  const InvoiceListWidget({Key? key, required this.invoiceListController}) : super(key: key);

  @override
  State<InvoiceListWidget> createState() => _InvoiceListWidgetState();
}

class _InvoiceListWidgetState extends State<InvoiceListWidget> {

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<InvoiceModel>>(
      valueListenable: widget.invoiceListController.invoiceValueNotifier,
      builder: (_, invoices, __) => Column(
          children: invoices.map((e) => InvoiceTileWidget(data: e)).toList()),
    );
  }
}
