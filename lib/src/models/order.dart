import 'package:intl/intl.dart';
class Order{
  String? createdBy;
  String? id;
  int? itemCount;
  String? totalAmount;
  String? updatedBy;
  String? venderId;

  Order(
      {this.createdBy, this.id, this.itemCount, this.totalAmount, this.updatedBy, this.venderId});

  Order.fromJson(Map<String, dynamic> json) {
    createdBy = DateFormat.yMMMEd().format(json['createdBy'].toDate()).toString();
    id = json['id'];
    itemCount = json['itemCount'];
    totalAmount = json['totalAmount'];
    updatedBy = DateFormat.yMMMEd().format(json['updatedBy'].toDate()).toString();
    venderId = json['venderId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdBy'] = this.createdBy;
    data['id'] = this.id;
    data['itemCount'] = this.itemCount;
    data['totalAmount'] = this.totalAmount;
    data['updatedBy'] = this.updatedBy;
    data['venderId'] = this.venderId;
    return data;
  }
}