import 'package:mall_plus_new_customer_app/models/deposit_model.dart';
import 'package:meta/meta.dart';
import 'user_address_model.dart';

class User {
  int? id;
  String? name;
  String? uid;
  String? email;
  String? phone;
  String? image;
  String? address;
  double? latitude;
  double? longitude;
  bool? status;
  UserAddress? home_address;
  UserAddress? nearest_address;
  List<UserAddress>? addresses;
  List<dynamic>? townships;
  double? discount;
  bool? has_free_delivery;

  Deposit? deposit;

  User({
    this.id,
    this.name,
    this.uid,
    this.email,
    this.phone,
    this.address,
    this.image,
    this.latitude,
    this.longitude,
    this.addresses,
    this.nearest_address,
    this.townships,
    this.home_address,
    this.discount,
    this.has_free_delivery,
    this.deposit,
    this.status,
  });
  User copyWith(
      {required UserAddress home_address,
      required UserAddress nearest_address,
      required double discount,
      required bool has_free_delivery,
      required String phone}) {
    return User(
        status: this.status,
        id: id ?? this.id,
        name: this.name,
        uid: this.uid,
        email: this.email,
        phone: phone ?? this.phone,
        address: this.address,
        home_address: home_address ?? this.home_address,
        image: this.image,
        latitude: this.latitude,
        longitude: this.longitude,
        nearest_address: nearest_address ?? this.nearest_address,
        addresses: this.addresses,
        townships: this.townships,
        discount: discount ?? this.discount,
        has_free_delivery: has_free_delivery ?? this.has_free_delivery,
        deposit: deposit ?? this.deposit);
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id']??null,
      name: json['name']??null,
      uid: json['uid']??null,
      email: json['email']??null,
      phone: json['phone']??null,
      address: json['address']??null,
      image: json['image']??null,
      latitude: json['latitude']??null,
      longitude: json['longitude']??null,
      addresses: json.containsKey('addresses') ? List<UserAddress>.from(
          json['addresses'].map((address) => UserAddress.fromJson(address))) : [],
      nearest_address: json['nearest_address'] != null
          ? UserAddress.fromJson(json['nearest_address'])
          : null,
      townships: json['townships'] != null
          ? List<dynamic>.from(json['townships'])
          : null,
      discount: json['discount'] != null ? json['discount'].toDouble() : null,
      has_free_delivery: json['has_free_delivery'],
      deposit:
          json['deposit'] != null ? Deposit.fromJson(json['deposit']) : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'uid': uid,
      'email': email,
      'phone': phone,
      'address': address,
      'image': image,
      'latitude': latitude,
      'longitude': longitude,
      'addresses': addresses!.map((address) => address.toJson()).toList(),
      'nearest_address':
          nearest_address != null ? nearest_address!.toJson() : null,
      'townships': townships,
      'discount': discount,
      'has_free_delivery': has_free_delivery,
      'deposit': deposit != null ? deposit!.toJson() : null,
      'status': status,
    };
  }

  @override
  List<Object> get props => [
        status!,
        id!,
        name!,
        uid!,
        email!,
        phone!,
        address!,
        home_address!,
        image!,
        latitude!,
        longitude!,
        nearest_address!,
        addresses!,
        townships!,
        discount!,
        has_free_delivery!,
        deposit!
      ];
}
