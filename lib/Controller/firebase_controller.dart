import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:prouserchallenge/Model/BarCode.dart';

class BarcodesDbController{

final _barCodesCollectionInstance=FirebaseFirestore.instance.collection("savedBarCodes");

saveBarcode(Map<String,dynamic> data){
  _barCodesCollectionInstance.add(data);
}

Stream<List<BarCode>> currentSavedCodesList(){
  return _barCodesCollectionInstance.snapshots().map((event) => event.docs.map((e) => BarCode.fromMap(e.id, e.data())).toList());
}

deleteBarcode(codeId)async {
  return await _barCodesCollectionInstance.doc(codeId).delete();
}


}