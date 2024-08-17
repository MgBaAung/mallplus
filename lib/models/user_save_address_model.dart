class UserSaveAddressModel {
  UserSaveAddressModel({
    required this.id,
    required this.userId,
    required this.title,
    required this.address,
    required this.addressDetail,
    required this.townshipId,
    required this.townshipName,
    required this.floor,
    required this.noteToBiker,
    required this.addressType,
    required this.latitude,
    required this.longitude,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
  });
  late final int id;
  late final int userId;
  late final String title;
  late final String address;
  late final String addressDetail;
  late final int townshipId;
  late final String townshipName;
  late final String floor;
  late final String noteToBiker;
  late final int addressType;
  late final num latitude;
  late final num longitude;
  late final String createdAt;
  late final String updatedAt;
  late final Null deletedAt;

  factory UserSaveAddressModel.emptyObj() {
    return UserSaveAddressModel(
        id: -1,
        userId: 0,
        title: "Current Location",
        address: "",
        addressDetail: "",
        townshipId: 0,
        townshipName: "",
        floor: "",
        noteToBiker: "",
        addressType: 0,
        latitude: 0,
        longitude: 0,
        createdAt: "",
        updatedAt: "");
  }

  UserSaveAddressModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    address = json['address'];
    addressDetail = json['address_detail'];
    townshipId = json['township_id'];
    townshipName = json['township_name'];
    floor = json['floor'];
    noteToBiker = json['note_to_biker'];
    addressType = json['address_type'];
    latitude = json['latitude'] is num
        ? json['latitude']
        : num.parse(json['latitude']) as num;
    longitude = json['longitude'] is num
        ? json['longitude']
        : num.parse(json['longitude']) as num;
    // latitude = json['latitude'];
    // longitude = json['longitude'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    deletedAt = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['title'] = title;
    _data['address'] = address;
    _data['address_detail'] = addressDetail;
    _data['township_id'] = townshipId;
    _data['township_name'] = townshipName;
    _data['floor'] = floor;
    _data['note_to_biker'] = noteToBiker;
    _data['address_type'] = addressType;
    _data['latitude'] = latitude;
    _data['longitude'] = longitude;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    _data['deleted_at'] = deletedAt;
    return _data;
  }
}
