class ProductModel{
  String? id;
  String? pName;
  String? pPrice;
  String? pCat;
  List<IngrediantsModel>? ingrediantsModel;
  String? pDes;
  String? pic;

  ProductModel({this.id ,this.pName, this.pPrice, this.pCat, this.pDes, this.pic, this.ingrediantsModel});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pName = json['pName'];
    pPrice = json['pPrice'];
    pCat = json['pCat'];
    pDes = json['pDes'];
    if (json['ingrediantsModel'] != null) {
      ingrediantsModel = <IngrediantsModel>[];
      json['ingrediantsModel'].forEach((v) {
        ingrediantsModel!.add(new IngrediantsModel.fromJson(v));
      });
    }
    pic = json['pic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pName'] = this.pName;
    data['pPrice'] = this.pPrice;
    data['pCat'] = this.pCat;
    data['pDes'] = this.pDes;
    if (this.ingrediantsModel != null) {
      data['ingrediantsModel'] = this.ingrediantsModel!.map((v) => v.toJson()).toList();
    }
    data['pic'] = this.pic;
    return data;
  }
}

class IngrediantsModel{
  String? name;
  String? image;

  IngrediantsModel({this.name ,this.image});

  IngrediantsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}