import 'package:flutter/material.dart';
import 'package:pay_flow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:pay_flow/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:pay_flow/shared/themes/app_colors.dart';
import 'package:pay_flow/shared/themes/app_text_styles.dart';
import 'package:pay_flow/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:pay_flow/shared/widgets/buttons_set/buttons_set_label.dart';

class BarCodeScannerPage extends StatefulWidget {
  const BarCodeScannerPage({Key? key}) : super(key: key);

  @override
  State<BarCodeScannerPage> createState() => _BarCodeScannerPageState();
}

class _BarCodeScannerPageState extends State<BarCodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.showCamera) {
                return Container(
                    child: controller.cameraController?.buildPreview());
              } else {
                return Container();
              }
            },
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
                backgroundColor: Colors.transparent,
                appBar: AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.black,
                  title: Text("Escaneie o código de barras do boleto",
                      style: TextStyles.buttonBackground),
                  leading: BackButton(color: AppColors.background),
                ),
                body: Column(
                  children: [
                    Expanded(
                        child: Container(color: Colors.black.withOpacity(0.7))),
                    Expanded(
                        flex: 2, child: Container(color: Colors.transparent)),
                    Expanded(
                        child: Container(color: Colors.black.withOpacity(0.7))),
                  ],
                ),
                bottomNavigationBar: ButtonsSetLabel(
                  primaryLabel: "Inserir código do boleto",
                  primaryOnTap: () {
                    Navigator.pushReplacementNamed(context, "/insert_invoices");
                  },
                  secondaryLabel: "Adicionar da galeria",
                  secondaryOnTap: ()  {
                    controller.scanWithImagePicker();
                  },
                )),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.hasError) {
                return BottomSheetWidget(
                  title: "Não foi possível carregar um código de barras.",
                  subTitle:
                      "Tente escanear novamente ou digite o código do seu boleto.",
                  primaryLabel: "Escanear novamente",
                  primaryOnTap: () {
                    controller.scanWithCamera();
                  },
                  secondaryLabel: "Digitar código",
                  secondaryOnTap: () {
                    Navigator.pushReplacementNamed(context, "/insert_invoices");
                  },
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    
    controller.getAvailableCameras();
    controller.statusNotifier.addListener(() {
      if (controller.status.hasBarcode) {
        Navigator.pushReplacementNamed(context, "/insert_invoices", arguments: controller.status.barcode);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    
    super.dispose();
  }
}
