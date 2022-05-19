import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:prouserchallenge/Model/BarCode.dart';
import 'package:prouserchallenge/View/components/dialogs.dart';
import 'package:prouserchallenge/View/components/snackbars.dart';
import 'package:validators/validators.dart';


class ScanHelpers {
  static const _barcodeColor = "#000000";
  static const _textOfScannerButton = "Cancelar";
  static const _failedScanResult="-1";

  static startCodeScan(context) async {
    try{
      var barcodeResult = await FlutterBarcodeScanner.scanBarcode(
          _barcodeColor, _textOfScannerButton, true, ScanMode.DEFAULT);
      if(barcodeResult!=_failedScanResult)
      _showScanResult(barcodeResult,context);
    }on Exception catch(exception){
      UiResponses().showFailedMessage("Falha Interna");

    }
  }

  static _showScanResult(String barcodeResult,context) {
      BarCode barCode = BarCode(dataOfCode: barcodeResult);
      barCode.isUrl = isURL(barcodeResult);
      ShowDialogs().showCodeToTheUser(barCode,context);


  }


}
