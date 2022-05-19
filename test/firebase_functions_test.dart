import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:prouserchallenge/Model/BarCode.dart';


void main() {
  final firestore = FakeFirebaseFirestore();
  final instance = firestore.collection("savedBarCodes");
  final BarCode barCode = BarCode(dataOfCode: "Texto de Teste");


  test('Teste para adicionar Dados ao Firestore', () async {
    var addedDocument = await instance.add(barCode.toMap());
    var addedConfirm = await instance
        .doc(addedDocument.id)
        .get()
        .then((value) => value.exists);
    barCode.documentId=addedDocument.id;
    expect(addedConfirm, true);
  });

  test('Teste para listar os Dados do Firestore', () async {
    var list = await instance.get().then((value) => value.docs.map((e) => BarCode.fromMap(e.id, e.data())).toList());
    expect(list.isEmpty, false);
  });


 test('Teste para  apagar dados do firestore', () async {

  instance.doc(barCode.documentId).delete();
  var deleteConfirm = await instance
      .doc(barCode.documentId)
      .get()
      .then((value) => value.exists==false);
  expect(deleteConfirm, true);

 });

}
