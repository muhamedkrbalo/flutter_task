import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/home/domain/entities/personal_info_entity.dart';
import 'package:flutter_task/features/home/presentation/controller/get_personal_info_cubit/get_personal_info_cubit.dart';
import 'package:flutter_task/features/home/presentation/views/widget/circle_avtar_list_view_item.dart';
import 'package:flutter_task/helpers/custom_widget/custom_loading.dart';

class CustomCircleAvatarImagePerson extends StatefulWidget {
  const CustomCircleAvatarImagePerson({
    Key? key,
  }) : super(key: key); 

  @override
  State<CustomCircleAvatarImagePerson> createState() => _CustomCircleAvatarImagePersonState();
}

class _CustomCircleAvatarImagePersonState extends State<CustomCircleAvatarImagePerson> {
  
  late final ScrollController _scrollController ;
   var nextPage=1;
   var isLoading=false;
   List<PersonalInfoEntity> personalInfoList=[];
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
      await  context.read<GetPersonalInfoCubit>().getPersonalInfo(
          pageNumber: nextPage++
        );
        
      } 
      isLoading=false;
      }
     }
     @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetPersonalInfoCubit, GetPersonalInfoState>(
      builder: (context, state) {
        if (state is GetPersonalSuccesses || state is GetPersonalPaginationLoading ) {
          return SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: personalInfoList.length,
                itemBuilder: (BuildContext context, int index) {
                  return CircleAvatarListViewItem(
                    personalInfo: personalInfoList[index],
                  );
                },
              ),
            ),
          );
        } else if (state is GetPersonalFailure) {
          return SliverToBoxAdapter(
            child: Text(state.errMessage),
          );
        } else {
          return const SliverToBoxAdapter(
            child: Center(child: CustomLoading()),
          );
        }
      }, listener: (BuildContext context, GetPersonalInfoState state) { 
        if(state is GetPersonalSuccesses){
          personalInfoList.addAll(state.personalInfo);
        }
       },
    );
  }
}
