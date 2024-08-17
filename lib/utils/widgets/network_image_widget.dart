import 'package:flutter/material.dart';
import 'package:mall_plus_new_customer_app/utils/constants/app_colors.dart';

// ignore: must_be_immutable
class NetworkImageWidget extends StatelessWidget {
  NetworkImageWidget(
      {Key? key,
      required this.url,
      this.sizeHeight,
      this.sizeWidth,
      this.fit = BoxFit.cover})
      : super(key: key);

  final String url;
  double? sizeHeight;
  double? sizeWidth;
  BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    if (url.isEmpty) return _errorWidget();
    return Image.network(
      url,
      width: sizeWidth,
      height: sizeHeight,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
        return _errorWidget();
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          width: sizeWidth,
          height: sizeHeight,
          color: Colors.grey.shade100,
          child: const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
        );
      },
    );
  }

  Container _errorWidget() {
    return Container(
      width: sizeWidth,
      height: sizeHeight,
      color: Colors.grey.shade100,
      //color: Colors.red,
      child: Center(
        child: Icon(
          Icons.image,
          size: (sizeHeight ?? 0) * 0.8,
          color: AppColors.primaryDark9,
        ),
      ),
    );
  }
}
