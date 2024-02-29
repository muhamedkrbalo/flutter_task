part of 'get_personal_info_cubit.dart';

sealed class GetPersonalInfoState {}

final class GetPersonalInitial extends GetPersonalInfoState {}
final class GetPersonalLoading extends GetPersonalInfoState {}
final class GetPersonalPaginationLoading extends GetPersonalInfoState {}
final class GetPersonalFailure extends GetPersonalInfoState {
  final String errMessage;

  GetPersonalFailure({required this.errMessage});
}
final class GetPersonalSuccesses extends GetPersonalInfoState {
  final List<PersonalInfoEntity> personalInfo;

  GetPersonalSuccesses({required this.personalInfo});
}

