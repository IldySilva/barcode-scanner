

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prouserchallenge/Controller/firebase_controller.dart';
import 'package:prouserchallenge/Controller/Services/scan_code_services.dart';
import 'package:prouserchallenge/Model/BarCode.dart';
import 'package:prouserchallenge/View/components/code_list_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.add),
                onPressed: () async {
                 await  ScanHelpers.startCodeScan(context);
                }),
            appBar: AppBar(
              title: const Text("ProuserCode Scanner"),
            ),
            body: StreamBuilder<List<BarCode>>(
              initialData: const [],
              stream: BarcodesDbController().currentSavedCodesList(),
              builder: (context, snapshots) {
                return Column(
                  children: [

                    Container(
                      height: Get.height * .07,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: Get.width * .08,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                const Text(
                                  "Códigos Salvos",
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                  snapshots.data!.length.toString(),
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50),
                          ),
                        ),
                        child:
                        snapshots.data!.isEmpty?const Center(child:  Text("Sem Códigos Adicionados, Faça uma leitura"),)
                      :  Container(
                          width: Get.width,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                SizedBox(height: Get.height*0.05,),
                                for (BarCode barcode in snapshots.data ?? [])
                                 CodeListTile(barcode:barcode)
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            )));
  }
}
