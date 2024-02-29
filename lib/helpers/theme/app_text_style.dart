
import 'package:flutter/cupertino.dart';
import 'package:flutter_task/helpers/theme/app_colors.dart';

class AppTextStyle{
  static TextStyle namePersonStyle(BuildContext context, ) {
    return TextStyle(
      fontSize: 15,
      fontWeight: FontWeight.w700,
      color:AppColors.darkColor,
      fontFamily: "Roboto"
    );
  }
  static TextStyle textRG10(BuildContext context, ) {
    return TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color:AppColors.greyColor,
      fontFamily: "Roboto"
    );
  }
}