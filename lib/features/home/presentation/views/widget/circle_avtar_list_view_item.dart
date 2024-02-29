import 'package:flutter/material.dart';
import 'package:flutter_task/features/home/domain/entities/personal_info_entity.dart';
import 'package:flutter_task/helpers/custom_widget/custom_network_image/custom_network_image.dart';
import 'package:flutter_task/helpers/theme/app_colors.dart';

class CircleAvatarListViewItem extends StatelessWidget {
  final PersonalInfoEntity personalInfo;
  const CircleAvatarListViewItem({
    super.key, required this.personalInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        width: 80,
        height: 80,
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(),
          gradient:  LinearGradient(
            colors: [
             AppColors.purpleColor,
             AppColors.pinkColor,
             AppColors.rosyColor,
             
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child:  Center(
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 40,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child:CircleAvatar(
                backgroundColor: Colors.white,
               radius: 37,
                child: CustomNetworkImage(
                  radius: 37,

                  imageUrl: personalInfo.imagePerson??""),
              )
              
             
            ),
          ),
        ));
  }
}