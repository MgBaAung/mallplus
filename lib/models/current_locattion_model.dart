class CurrentLocation {
  String? loginToken;
  String? savedUserId;
  int? userId;

  double? latitude;
  double? longitude;
  String? googleAddress;
  String? address;
  int? addressType;
  String? addressTypeName;
  int? selectedAddressType;

  CurrentLocation(
      {this.loginToken,
      this.savedUserId,
      this.userId,
      this.latitude,
      this.longitude,
      this.googleAddress,
      this.address,
      this.addressType,
      this.addressTypeName,
      this.selectedAddressType});

  CurrentLocation copyWith(
      {String? loginToken, String? savedUserId, int? selectedAddressType}) {
    return CurrentLocation(
        loginToken: this.loginToken ?? loginToken,
        savedUserId: this.savedUserId ?? savedUserId,
        userId: userId,
        latitude: latitude,
        longitude: longitude,
        googleAddress: googleAddress,
        address: address,
        addressType: addressType,
        addressTypeName: addressTypeName,
        selectedAddressType: this.selectedAddressType ?? selectedAddressType);
  }

  @override
  List<Object?> get props =>
      [latitude, longitude, address, selectedAddressType];

  @override
  String toString() => 'Post { userId: $userId }';
}
