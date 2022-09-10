import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{
  String? id;
  String? pName;

  CategoryModel({this.id ,this.pName,});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pName = json['pName'];
  }
  factory CategoryModel.fromFireStore(DocumentSnapshot doc)
  {
    Map data = doc.data as Map ;
    return CategoryModel(
        id: data['id'],
        pName: data['pName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['pName'] = this.pName;
    return data;
  }
}