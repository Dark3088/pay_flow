import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/invoice_model/invoice_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InsertInvoicesController {
  final formKey = GlobalKey<FormState>();
  InvoiceModel invoiceModel = InvoiceModel();

  String? validateName(String? invoiceName) =>
      invoiceName?.isEmpty ?? true ? "Insira um nome para o boleto" : null;

  String? validateDueDate(String? date) =>
      date?.isEmpty ?? true ? "Insira uma data de vencimento" : null;

  String? validateValue(double invoiceValue) =>
      invoiceValue == 0 ? "Insira um valor maior que R\$ 0,00" : null;

  String? validateCode(String? invoiceBarcode) =>
      invoiceBarcode?.isEmpty ?? true ? "Insira um código de barras" : null;

  void onChange(
      {String? invoiceName,
      String? date,
      double? invoiceValue,
      String? invoiceBarcode}) {
    invoiceModel = invoiceModel.copyWith(
        name: invoiceName,
        dueDate: date,
        value: invoiceValue,
        barcode: invoiceBarcode);
  }

  Future<void> saveInvoice() async {
    try {
      final sharedPrefs = await SharedPreferences.getInstance();
      final invoices = sharedPrefs.getStringList("invoices") ?? <String>[];
      invoices.add(invoiceModel.toJson());
      await sharedPrefs.setStringList("invoices", invoices);
      return;
    } catch (e) {}
  }

  Future<void> fileInvoice() async {
    final form = formKey.currentState;
    if (form!.validate()) {
      return saveInvoice();
    }
  }
}
