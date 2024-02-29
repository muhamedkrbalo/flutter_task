import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_task/helpers/app_images/app_images.dart';
import 'package:flutter_task/helpers/theme/app_colors.dart';



class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final double radius;
  final BoxFit? fit;


  const CustomNetworkImage({
    Key? key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit,
    this.radius = 0,
  
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: CachedNetworkImage(
          imageUrl: imageUrl,
          fit: fit,
          width: width,
          height: height,
          placeholder: (context, url) => CupertinoActivityIndicator(
            color: AppColors.purpleColor,
          ),
          errorWidget: (context, url, error) => Image(
            image: const AssetImage(AppImages.searchIcon),
            fit: fit,
            width: width,
            height: height,
          ),
        ),
      ),
    );
  }
}