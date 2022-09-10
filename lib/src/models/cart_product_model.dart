class CartProductModel{
  String? productName;
  String? productCatName;
  String? resturentName;
  String? resturentid;
  String? quantity;
  String? eachItemPrice;
  String? totalItemPrice;

  CartProductModel(
      {this.productName,
      this.productCatName,
      this.resturentName,
      this.resturentid,
      this.quantity,
      this.eachItemPrice,
      this.totalItemPrice});

  static List<CartProductModel> fromJsonList(Map<String, dynamic> json) {
    List<dynamic> jsonList = [];

    List<CartProductModel> cartProductModel = [];
    for (var v in jsonList) {
      cartProductModel.add(CartProductModel.fromJson(v));
    }
    return cartProductModel;
  }

  CartProductModel.fromJson(Map<String, dynamic> json) {
    productName = json['productName'];
    productCatName = json['productCatName'];
    resturentName = json['resturentName'];
    resturentid = json['resturentid'];
    quantity = json['quantity'];
    eachItemPrice = json['eachItemPrice'];
    totalItemPrice = json['totalItemPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    data['productCatName'] = this.productCatName;
    data['resturentName'] = this.resturentName;
    data['resturentid'] = this.resturentid;
    data['quantity'] = this.quantity;
    data['eachItemPrice'] = this.eachItemPrice;
    data['totalItemPrice'] = this.totalItemPrice;
    return data;
  }
}