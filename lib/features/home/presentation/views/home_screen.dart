import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/home/presentation/controller/get_personal_info_cubit/get_personal_info_cubit.dart';
import 'package:flutter_task/features/home/presentation/views/widget/custom_circle_avatar_image.dart';
import 'package:flutter_task/features/home/presentation/views/widget/custom_personal_info_list.dart';
import 'package:flutter_task/features/home/presentation/views/widget/custom_text_form_field_search.dart';
import 'package:flutter_task/helpers/theme/app_colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ScrollController _scrollController ;
   var nextPage=1;
   var isLoading=false;
      @override
   void initState() {
     super.initState();
     _scrollController = ScrollController();
     _scrollController.addListener(_scrollListener);

   }
     void _scrollListener()async{
     if(!isLoading){
        isLoading=true;
       
        if(_scrollController.position.pixels >= 0.7 * _scrollController.position.maxScrollExtent){
      await  BlocProvider.of<GetPersonalInfoCubit>(context).getPersonalInfo(
          pageNumber: nextPage++
        );
        }
        isLoading=false;
      }
     }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: CustomScrollView(
              controller: _scrollController,
              slivers: [
              const CustomCircleAvatarImagePerson(),
             
              SliverToBoxAdapter(
                child: Divider(
                  color: AppColors.greyColor,
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(height: 10),
              ),
              const CustomTextFormFiledSearch(),
              const SliverToBoxAdapter(
                child: SizedBox(height: 16),
              ),
              const CustomPersonalInfoList()
            ]),
          ),
        ));
  }
}
