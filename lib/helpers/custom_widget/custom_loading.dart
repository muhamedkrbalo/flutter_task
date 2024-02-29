import 'package:flutter/cupertino.dart';
import 'package:flutter_task/helpers/theme/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class CustomLoading extends StatelessWidget {
  final double size;
  final Color? color;
  const CustomLoading({
    Key? key,
    this.size = 30,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.discreteCircle(
      color: AppColors.purpleColor ,
      
      secondRingColor:  AppColors.purpleColor,
      thirdRingColor: AppColors.purpleColor ,
      size: size,
    );
  }
}
