import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prouserchallenge/Controller/Services/url_launcher_services.dart';
import 'package:prouserchallenge/Model/BarCode.dart';
import '../../Controller/firebase_controller.dart';

class ShowDialogs {


  showCodeToTheUser(BarCode barCode, context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text("Resultado da Leitura"),
            children: [
           const   Icon(
                Icons.done_rounded,
                size: 50,
                color: Colors.greenAccent,
              ),
              SizedBox(
                height: Get.height * 0.02,
              ),
              Center(
                  child: Text(
                barCode.dataOfCode,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              )),
              SizedBox(
                height: Get.height * 0.03,
              ),

              if(barCode.isUrl)
                TextButton(child: const Text("Acessar URL"),onPressed: () async {

              URLauncher().launchUrl(barCode.dataOfCode);

                },),
              Container(
                margin: EdgeInsets.symmetric(horizontal: Get.width * 0.02),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.indigo)),
                child: TextButton.icon(
                    onPressed: () async {
                      Navigator.pop(context);
                       await  BarcodesDbController().saveBarcode(barCode.toMap());

                    },
                    icon: Icon(Icons.save),
                    label: Text(" Salvar")),
              )
            ],
          );
        });
  }


  removeCodeConfirmation(context,documentId)async{

    return await showDialog(context: context, builder: (context){

      return AlertDialog(title: Text("Deseja Realmente remover este registo?"),actions: [

        TextButton(onPressed: ()=>Navigator.pop(context), child: Text("Não")),
        TextButton(onPressed: () async {

          Navigator.pop(context);
          await  BarcodesDbController().deleteBarcode(documentId);


        }, child: Text("Confirmar",style: TextStyle(color: Colors.red.shade400),))

      ],);

    });
  }
}
