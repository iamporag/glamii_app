import 'package:flutter/cupertino.dart';
import '../../util/images.dart';

class CustomImage extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final String? placeholder;

  const CustomImage({
    super.key,
    required this.image,
    this.height,
    this.width,
    this.fit,
    this.placeholder,
  });

  @override
  Widget build(BuildContext context) {
    return FadeInImage.assetNetwork(
      placeholder: placeholder ?? Images.placeholder,
      image: image,
      height: height,
      width: width,
      fit: fit,
      imageErrorBuilder: (context, error, stackTrace) {
        return Image.asset(
          placeholder ?? Images.placeholder,
          height: height,
          width: width,
          fit: fit,
        );
      },
    );
  }
}
