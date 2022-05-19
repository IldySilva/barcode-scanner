class BarCode {
  var documentId;
  var dataOfCode;
  var descriptionOfCode;
  var isUrl;

  BarCode({this.dataOfCode, this.descriptionOfCode, this.documentId,this.isUrl=false});

  factory BarCode.fromMap(String documentId, Map<String, dynamic> map) {
    return BarCode(
        dataOfCode: map["dataOfCode"],
        descriptionOfCode: map["descriptionOfCode"],
        isUrl: map["isUrl"],
        documentId: documentId);
  }

  Map<String, dynamic> toMap() {
    return ({"dataOfCode": dataOfCode, "descriptionOfCode": descriptionOfCode,"isUrl":isUrl});
  }
}
