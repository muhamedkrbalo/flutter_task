import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/home/domain/entities/personal_info_entity.dart';
import 'package:flutter_task/features/home/presentation/controller/get_personal_info_cubit/get_personal_info_cubit.dart';
import 'package:flutter_task/features/home/presentation/views/widget/custom_container_personal_info.dart';
import 'package:flutter_task/helpers/custom_widget/custom_loading.dart';

class CustomPersonalInfoList extends StatefulWidget {
  const CustomPersonalInfoList({
    super.key,
  });

  @override
  State<CustomPersonalInfoList> createState() => _CustomPersonalInfoListState();
}

class _CustomPersonalInfoListState extends State<CustomPersonalInfoList> {
  List<PersonalInfoEntity> personalInfoList = [];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetPersonalInfoCubit, GetPersonalInfoState>(
      builder: (context, state) {
        if (state is GetPersonalSuccesses ||
            state is GetPersonalPaginationLoading) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return CustomContainerPersonalInfo(
                    personalInfo: personalInfoList[index]);
              },
              childCount: personalInfoList.length,
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
      },
      listener: (BuildContext context, GetPersonalInfoState state) {
        if (state is GetPersonalSuccesses) {
          personalInfoList.addAll(state.personalInfo);
        }
      },
    );
  }
}
