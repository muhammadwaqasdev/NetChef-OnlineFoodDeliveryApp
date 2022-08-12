
import '../base/utils/utils.dart';


class CustomerUser {
  String? address;
  String? email;
  String? fullName;
  String? id;
  String? identityNumber;
  int? orderCount;
  int? totalOrderAmount;
  String? phoneNumber;
  String? gender;
  String? profile;

  Gender get userGender => gender == "Male" ? Gender.MALE : Gender.FEMALE;

  CustomerUser(
      {this.address,
        this.email,
        this.fullName,
        this.profile,
        this.id,
        this.identityNumber,
        this.orderCount,
        this.totalOrderAmount,
        this.phoneNumber,
        this.gender});

  CustomerUser.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    email = json['email'];
    fullName = json['fullName'];
    profile = json['profile'];
    id = json['id'];
    identityNumber = json['identityNumber'];
    orderCount = json['orderCount'];
    totalOrderAmount = json['totalOrderAmount'];
    phoneNumber = json['phoneNumber'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['profile'] = this.profile;
    data['id'] = this.id;
    data['identityNumber'] = this.identityNumber;
    data['orderCount'] = this.orderCount;
    data['totalOrderAmount'] = this.totalOrderAmount;
    data['phoneNumber'] = this.phoneNumber;
    data['gender'] = this.gender;
    return data;
  }
}

class ChefUser {
  String? id;
  String? address;
  String? email;
  String? fullName;
  String? identityNumber;
  String? phoneNumber;
  String? gender;
  String? businessName;
  String? businessIcon;
  int? currentCategories;
  int? currentProducts;
  int? ordersCompletedCount;
  int? ordersPendingCount;
  int? ordersCompletedAmount;
  int? ordersPendingAmount;


  ChefUser({
    this.id,
    this.address,
    this.email,
    this.fullName,
    this.identityNumber,
    this.phoneNumber,
    this.gender,
    this.businessName,
    this.businessIcon,
    this.currentCategories,
    this.currentProducts,
    this.ordersCompletedCount,
    this.ordersPendingCount,
    this.ordersCompletedAmount,
    this.ordersPendingAmount
});

  ChefUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    email = json['email'];
    fullName = json['fullName'];
    id = json['id'];
    identityNumber = json['identityNumber'];
    phoneNumber = json['phoneNumber'];
    gender = json['gender'];
    businessName = json['businessName'];
    businessIcon = json['businessIcon'];
    currentCategories = json['currentCategories'];
    currentProducts = json['currentProducts'];
    ordersCompletedCount = json['OrdersCompletedCount'];
    ordersPendingCount = json['OrdersPendingCount'];
    ordersCompletedAmount = json['OrdersCompletedAmount'];
    ordersPendingAmount = json['OrdersPendingAmount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['email'] = this.email;
    data['fullName'] = this.fullName;
    data['id'] = this.id;
    data['identityNumber'] = this.identityNumber;
    data['phoneNumber'] = this.phoneNumber;
    data['gender'] = this.gender;
    data['businessName'] = this.businessName;
    data['businessIcon'] = this.businessIcon;
    data['currentCategories'] = this.currentCategories;
    data['currentProducts'] = this.currentProducts;
    data['OrdersCompletedCount'] = this.ordersCompletedCount;
    data['OrdersPendingCount'] = this.ordersPendingCount;
    data['OrdersCompletedAmount'] = this.ordersCompletedAmount;
    data['OrdersPendingAmount'] = this.ordersPendingAmount;
    return data;
  }
}

