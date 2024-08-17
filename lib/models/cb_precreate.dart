class CbPrecreateModel {
  final String result;
  final String generateRefOrder;
  final String code;
  final String msg;
  final int paymentProvider;
  // final String merchCode;
  // final String appId;
  // final String appKey;
  CbPrecreateModel({
    required this.result,
    required this.generateRefOrder,
    required this.code,
    required this.msg,
    required this.paymentProvider,
    // this.merchCode,
    // this.appId,
    // this.appKey
  });

  CbPrecreateModel copyWith({
    String? result,
    String? generateRefOrder,
    String? code,
    String? msg,
    int? paymentProvider,
    // String merchCode,
    // String appId,
    // String appKey,
  }) {
    return CbPrecreateModel(
      result: result ?? this.result,
      generateRefOrder: generateRefOrder ?? this.generateRefOrder,
      code: code ?? this.code,
      msg: msg ?? this.msg,
      paymentProvider: paymentProvider ?? this.paymentProvider,
      // merchCode: merchCode ?? this.merchCode,
      // appId: appId ?? this.appId,
      // appKey: appKey ?? this.appKey
    );
  }
}
