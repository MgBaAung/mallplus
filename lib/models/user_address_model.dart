import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class UserAddress extends Equatable {
  final int? id;
  final String? place_id;//
  final int? user_id;
  final String? title;
  final String? address;//
  final String? address_detail;//
  final String? floor;//
  final int? township_id;
  final String? township_name;
  final String? note_to_biker;
  final int? address_type;
  final int? selected_index;
  final List<dynamic>? townships;
  final double? original_latitude;
  final double? original_longitude;
  final double? latitude;
  final double? longitude;
  final String? action_type;
  final bool? change_address_status;

  UserAddress({
    this.id,
    this.place_id,
    this.user_id,
    this.title,
    this.address,
    this.address_detail,
    this.floor,
    this.township_id,
    this.township_name,
    this.note_to_biker,
    this.address_type,
    this.selected_index,
    this.townships,
    this.original_latitude,
    this.original_longitude,
    this.latitude,
    this.longitude,
    this.action_type,
    this.change_address_status,
  });

  factory UserAddress.fromJson(Map<String, dynamic> json) {
    print(json['latitude'].runtimeType);
    return UserAddress(
      id: json['id'],
      place_id: json['place_id'],
      user_id: json['user_id'],
      title: json['title'],
      address: json['address'],
      address_detail: json['address_detail'],
      floor: json['floor'],
      township_id: json['township_id'],
      township_name: json['township_name'],
      note_to_biker: json['note_to_biker'],
      address_type: json['address_type'],
      selected_index: json['selected_index'],
      townships: json['townships'],
      original_latitude: json['original_latitude'],
      original_longitude: json['original_longitude'],
      latitude: json['latitude'] is double ?json['latitude']: double.parse(json['latitude']) as double,
      longitude:json['longitude'] is double ?json['longitude']: double.parse(json['longitude']) as double,
      action_type: json['action_type'],
      change_address_status: json['change_address_status'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'place_id': place_id,
      'user_id': user_id,
      'title': title,
      'address': address,
      'address_detail': address_detail,
      'floor': floor,
      'township_id': township_id,
      'township_name': township_name,
      'note_to_biker': note_to_biker,
      'address_type': address_type,
      'selected_index': selected_index,
      'townships': townships,
      'original_latitude': original_latitude,
      'original_longitude': original_longitude,
      'latitude': latitude,
      'longitude': longitude,
      'action_type': action_type,
      'change_address_status': change_address_status,
    };
  }

  UserAddress copyWith({
    int? id,
    String? place_id,
    int? user_id,
    String? title,
    String? address,
    String? address_detail,
    String? floor,
    int? township_id,
    String? township_name,
    String? note_to_biker,
    int? address_type,
    int? selected_index,
    List<dynamic>? townships,
    double? original_latitude,
    double? original_longitude,
    double? latitude,
    double? longitude,
    String? action_type,
    bool? change_address_status,
  }) {
    return UserAddress(
      id: id ?? this.id,
      place_id: place_id ?? this.place_id,
      user_id: user_id ?? this.user_id,
      title: title ?? this.title,
      address: address ?? this.address,
      address_detail: address_detail ?? this.address_detail,
      floor: floor ?? this.floor,
      township_id: township_id ?? this.township_id,
      township_name: township_name ?? this.township_name,
      note_to_biker: note_to_biker ?? this.note_to_biker,
      address_type: address_type ?? this.address_type,
      selected_index: selected_index ?? this.selected_index,
      townships: townships ?? this.townships,
      original_latitude: original_latitude ?? this.original_latitude,
      original_longitude: original_longitude ?? this.original_longitude,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      action_type: action_type ?? this.action_type,
      change_address_status:
          change_address_status ?? this.change_address_status,
    );
  }

  @override
  List<Object?> get props => [
        id,
        place_id,
        user_id,
        title,
        address,
        address_detail,
        floor,
        township_id,
        township_name,
        note_to_biker,
        address_type,
        selected_index,
        townships,
        original_latitude,
        original_longitude,
        latitude,
        longitude,
        action_type,
        change_address_status,
      ];
}
