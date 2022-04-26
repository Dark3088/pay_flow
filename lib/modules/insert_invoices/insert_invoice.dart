import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/buttons_set/buttons_set_label.dart';
import 'package:pay_flow/shared/widgets/input_text/input_text_widget.dart';

class InsertInvoice extends StatefulWidget {
  final String? barcode;
  const InsertInvoice({Key? key, this.barcode}) : super(key: key);

  @override
  _InsertInvoiceState createState() => _InsertInvoiceState();
}

class _InsertInvoiceState extends State<InsertInvoice> {
  final moneyTextController =
      MoneyMaskedTextController(leftSymbol: "R\$", decimalSeparator: ",");

  final dueDateMask = MaskedTextController(mask: "00/00/0000");

  final barcodeInputController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputController.text = widget.barcode!;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        leading: BackButton(
          color: AppColors.input,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 69),
              child: Text("Preencha os dados do boleto",
                  style: TextStyles.titleBoldHeading,
                  textAlign: TextAlign.center),
            ),
            SizedBox(
              height: 32,
            ),
            InputTextWidget(
                label: "Nome do boleto",
                icon: FontAwesomeIcons.fileLines,
                onChanged: (value) {}),
            InputTextWidget(
                label: "Vencimento",
                editingController: dueDateMask,
                icon: FontAwesomeIcons.circleXmark,
                onChanged: (value) {}),
            InputTextWidget(
                label: "Valor",
                editingController: moneyTextController,
                icon: FontAwesomeIcons.dollarSign,
                onChanged: (value) {}),
            InputTextWidget(
                label: "Código",
                editingController: barcodeInputController,
                icon: FontAwesomeIcons.barcode,
                onChanged: (value) {}),
          ],
        ),
      ),
      bottomNavigationBar: ButtonsSetLabel(
          primaryLabel: "Cancelar",
          primaryOnTap: () {
            Navigator.pop(context);
          },
          secondaryLabel: "Cadastrar",
          enableSecondaryColor: true,
          secondaryOnTap: () {}),
    );
  }
}
