import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prouserchallenge/Controller/Services/url_launcher_services.dart';
import 'package:prouserchallenge/Model/BarCode.dart';
import 'dialogs.dart';

class CodeListTile extends StatelessWidget {
  BarCode barcode;

  CodeListTile({required this.barcode});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, offset: Offset(1, 1), blurRadius: 12)
          ]),
      child: ListTile(
        onTap: () {
          if (barcode.isUrl) URLauncher().launchUrl(barcode.dataOfCode);
        },
        title: Text(barcode.dataOfCode),
        subtitle: Text((barcode.isUrl ?? false)
            ? "Clique para acessar o link"
            : "Texto Simples"),
        trailing: IconButton(
            onPressed: () {
              ShowDialogs().removeCodeConfirmation(context, barcode.documentId);
            },
            icon: Icon(
              Icons.delete,
              color: Colors.indigo.shade200,
            )),
      ),
    );
  }
}
