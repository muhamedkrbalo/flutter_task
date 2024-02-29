import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task/helpers/app_images/app_images.dart';
import 'package:flutter_task/helpers/theme/app_colors.dart';

class CustomTextFormFiledSearch extends StatelessWidget {
  const CustomTextFormFiledSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: TextFormField(
        decoration: InputDecoration(
            filled: true,
            hintStyle: const TextStyle(color: Color(0xff888888)),
            fillColor: AppColors.fillColorTextFormField,
            hintText: 'Search',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Colors.transparent,
              ),
            ),
            prefixIcon: Padding(
              padding: const EdgeInsets.all(10),
              child: SvgPicture.asset(
                AppImages.searchIcon,
                width: 20,
                height: 20,
              ),
            ),
            contentPadding: const EdgeInsets.all(15)),
      ),
    );
  }
}
