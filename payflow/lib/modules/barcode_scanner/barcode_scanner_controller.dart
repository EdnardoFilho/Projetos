import 'package:camera/camera.dart';
import '../barcode_scanner_status.dart';

class BarcodeScannerController {
  BarCodeScannerStatus status = BarCodeScannerStatus();
  void getAvailableCameras() async {
    try {
      final response = await availableCameras();
      final camera = response.firstWhere(
        (element) => element.lensDirection == CameraLensDirection.back,
      );
      final cameraController = CameraController(
        camera,
        ResolutionPreset.max,
        enableAudio: false,
      );
      status = BarCodeScannerStatus.available(cameraController);
    } catch (e) {
      status = BarCodeScannerStatus.error(e.toString());
    }
  }
}
