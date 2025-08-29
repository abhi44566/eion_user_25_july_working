import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomNetworkProfileImage extends StatelessWidget {
  final String image;
  double? width;
  double? height;
  double? borderRadius;
  CustomNetworkProfileImage({super.key, required this.image,this.height,this.width,this.borderRadius});
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:BorderRadius.circular(borderRadius??40),
      child: CachedNetworkImage(
        width: width,
        height: height,
        fit: BoxFit.fill,
        imageUrl: image,
        progressIndicatorBuilder: (context, url, downloadProgress) =>
            CircularProgressIndicator(value: downloadProgress.progress),
        errorWidget: (context, url, error) =>Icon(Icons.account_circle_outlined,size: 50,)
      ),
    );
  }
}
class CustomNetworkImage extends StatelessWidget {
  final String image;

  const CustomNetworkImage({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: BoxFit.cover,
      imageUrl: image,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(

                  value: downloadProgress.progress),
            ],
          ),
      errorWidget: (context, url, error) =>  Text("No Image"),
    );
  }
}