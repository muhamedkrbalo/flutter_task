import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/features/home/domain/entities/personal_info_entity.dart';
import 'package:flutter_task/features/home/presentation/views/widget/custom_dialog.dart';
import 'package:flutter_task/helpers/app_images/app_images.dart';
import 'package:flutter_task/helpers/custom_widget/custom_network_image/custom_network_image.dart';
import 'package:flutter_task/helpers/theme/app_colors.dart';
import 'package:flutter_task/helpers/theme/app_text_style.dart';

class CustomContainerPersonalInfo extends StatelessWidget {
  final PersonalInfoEntity personalInfo;
  const CustomContainerPersonalInfo({
    super.key,
    required this.personalInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: AppColors.redTransparentColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
              margin: const EdgeInsets.all(10),
              width: 80,
              height: 80,
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    AppColors.purpleColor,
                    AppColors.pinkColor,
                    AppColors.rosyColor,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                  padding: const EdgeInsets.all(0.5),
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      width: 78,
                      height: 78,
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CustomNetworkImage(
                              imageUrl: personalInfo.imagePerson ?? ""),
                        ),
                      )))),
          const SizedBox(
            width: 5,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                personalInfo.namePerson ?? "",
                style: AppTextStyle.namePersonStyle(context),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                personalInfo.emailPerson ?? "",
                style: AppTextStyle.textRG10(context)
                    .copyWith(color: const Color(0xff757575)),
              ),
            ],
          ),
          const Spacer(),
          InkWell(
              onTap: () {
                customDialog(context);
              },
              child: SvgPicture.asset(AppImages.deleteIcon))
        ],
      ),
    );
  }

   
}
