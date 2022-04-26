import 'package:flutter/cupertino.dart';

class InsertInvoicesController {

  final formKey = GlobalKey<FormState>();

  String? validateName(String? invoiceName) =>
  invoiceName?.isEmpty ?? true ? "Insira um nome para o boleto" : null;

  String? validateDueDate(String? date) =>
  date?.isEmpty ?? true ? "Insira uma data de vencimento" : null;

  String? validateValue(double invoiceValue) =>
      invoiceValue == 0 ? "Insira um valor maior que R\$ 0,00" : null;

  String? validateCode(String? invoiceBarcode) =>
      invoiceBarcode?.isEmpty ?? true ? "Insira um código de barras" : null;

  void onChange({String? invoiceName, String? date, double? invoiceValue, String? invoiceBarcode}) {

  }

  void fileInvoice(){
    final form = formKey.currentState;
    if (form!.validate()){

    }
  }

}