import 'package:flutter/material.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/buttons_set/buttons_set_label.dart';
import 'package:pay_flow/shared/widgets/divider_vertical/divider_vertical_widget.dart';
import 'package:pay_flow/shared/widgets/label_button/label_button.dart';

class BarCodeScannerPage extends StatefulWidget {
  const BarCodeScannerPage({Key? key}) : super(key: key);

  @override
  State<BarCodeScannerPage> createState() => _BarCodeScannerPageState();
}

class _BarCodeScannerPageState extends State<BarCodeScannerPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: RotatedBox(
        quarterTurns: 1,
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              backgroundColor: Colors.black,
              title: Text("Escaneie o código de barras do boleto",
                  style: TextStyles.buttonBackground),
              leading: BackButton(color: AppColors.background),
            ),
            body: Column(
              children: [
                Expanded(child: Container(color: Colors.black.withOpacity(0.7))),
                Expanded(flex: 2, child: Container(color: Colors.transparent)),
                Expanded(child: Container(color: Colors.black.withOpacity(0.7))),
              ],
            ),
            bottomNavigationBar: ButtonsSetLabel(
              primaryLabel: "Inserir código do boleto",
              primaryOnTap: () {},
              secondaryLabel: "Adicionar da galeria",
              secondaryOnTap: () {},
            )),
      ),
    );
  }
}
