import 'package:flutter/material.dart';
import 'package:pay_flow/shared/models/invoice_model/invoice_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class InvoiceListController {

  final invoiceValueNotifier = ValueNotifier<List<InvoiceModel>>(<InvoiceModel>[]);

  List<InvoiceModel> get invoiceModelList =>  invoiceValueNotifier.value;
  set invoiceModelList(List<InvoiceModel> value)  => invoiceValueNotifier.value = value;

  Future<void> getInvoices() async {
    try {

      final sharedPrefs = await SharedPreferences.getInstance();
      final invoiceList = sharedPrefs.getStringList("invoices") ?? <String>[];
      
      invoiceModelList = invoiceList.map((e) => InvoiceModel.fromJson(e)).toList();

    } catch (e) {
      invoiceModelList = <InvoiceModel>[];
    }
  }
}