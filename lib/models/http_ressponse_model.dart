class HttpResponseModel {
  final bool isSuceess;
  final String statusCode;
  final String message;
  final dynamic data;

  HttpResponseModel(
      {required this.isSuceess,
      required this.statusCode,
      required this.data,
      required this.message});

  HttpResponseModel copyWith(
      {bool? isSucess, String? statusCode, String? message, dynamic data}) {
    return HttpResponseModel(
        isSuceess: isSucess ?? this.isSuceess,
        statusCode: statusCode ?? this.statusCode,
        data: data ?? this.data,
        message: message ?? this.message);
  }
}
