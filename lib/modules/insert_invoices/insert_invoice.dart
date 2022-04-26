import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/input_text/input_text_widget.dart';

class InsertInvoice extends StatelessWidget {
  const InsertInvoice({Key? key}) : super(key: key);

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 93, vertical: 24),
            child: Text("Preencha os dados do Boleto",
                style: TextStyles.titleBoldHeading,
                textAlign: TextAlign.center),
          ),
          InputTextWidget(
              label: "Nome do Boleto", icon: FontAwesomeIcons.fileLines),
          InputTextWidget(
              label: "Vencimento", icon: FontAwesomeIcons.circleXmark),
          InputTextWidget(
              label: "Valor", icon: FontAwesomeIcons.dollarSign),
          InputTextWidget(
              label: "Código", icon: FontAwesomeIcons.barcode),
        ],
      ),
    );
  }
}
