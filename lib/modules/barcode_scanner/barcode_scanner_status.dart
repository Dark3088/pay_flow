import 'package:camera/camera.dart';

class BarcodeScannerStatus {
  final bool isCameraAvailable;
  final String error;
  final String barcode;

  CameraController? cameraController;

  BarcodeScannerStatus({
    this.isCameraAvailable = false,
    this.cameraController,
    this.error = "",
    this.barcode = "",
  });

  factory BarcodeScannerStatus.available(CameraController _controller) =>
      BarcodeScannerStatus(
          isCameraAvailable: true, cameraController: _controller);

  factory BarcodeScannerStatus.error(String _message) =>
      BarcodeScannerStatus(error: _message);

  factory BarcodeScannerStatus.barcode(String _barcode) =>
      BarcodeScannerStatus(barcode: _barcode);

  bool get showCamera => isCameraAvailable && error.isEmpty;

  bool get hasError => error.isNotEmpty;

  bool get hasBarcode => barcode.isNotEmpty;
}
