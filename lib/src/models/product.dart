class ProductModel{
  String? id;
  String? pName;
  String? pPrice;
  String? pCat;
  String? pDes;
  String? pic;

  ProductModel({this.id ,this.pName, this.pPrice, this.pCat, this.pDes, this.pic});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pName = json['pName'];
    pPrice = json['pPrice'];
    pCat = json['pCat'];
    pDes = json['pDes'];
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pName'] = this.pName;
    data['pPrice'] = this.pPrice;
    data['pCat'] = this.pCat;
    data['pDes'] = this.pDes;
    data['pic'] = this.pic;
    return data;
  }
}