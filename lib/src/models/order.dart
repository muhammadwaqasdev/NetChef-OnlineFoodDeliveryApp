import 'package:intl/intl.dart';
import 'package:net_chef/src/models/cart_product_model.dart';
class Order{
  String? createdBy;
  String? id;
  int? itemCount;
  List<CartProductModel>? items;
  String? totalAmount;
  String? updatedBy;
  List<String>? venderId;

  Order(
      {this.createdBy, this.id, this.itemCount,this.items, this.totalAmount, this.updatedBy, this.venderId});

  Order.fromJson(Map<String, dynamic> json) {
    createdBy = DateFormat.yMMMEd().format(json['createdBy'].toDate()).toString();
    id = json['id'];
    itemCount = json['itemCount'];
    if (json['items'] != null) {
      items = <CartProductModel>[];
      json['items'].forEach((v) {
        items!.add(new CartProductModel.fromJson(v));
      });
    }
    totalAmount = json['totalAmount'];
    updatedBy = DateFormat.yMMMEd().format(json['updatedBy'].toDate()).toString();
    venderId = json['venderId'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdBy'] = this.createdBy;
    data['id'] = this.id;
    data['itemCount'] = this.itemCount;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    data['totalAmount'] = this.totalAmount;
    data['updatedBy'] = this.updatedBy;
    data['venderId'] = this.venderId;
    return data;
  }
}