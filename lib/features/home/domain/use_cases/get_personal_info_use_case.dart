import 'package:dartz/dartz.dart';
import 'package:flutter_task/features/home/domain/entities/personal_info_entity.dart';
import 'package:flutter_task/features/home/domain/repos/home_repo.dart';
import 'package:flutter_task/helpers/error/failures.dart';

class GetPersonalInfoUseCase{
  final HomeRepo homeRepo;

  GetPersonalInfoUseCase({required this.homeRepo});
   Future<Either<Failure,List<PersonalInfoEntity>>>getPersonalInfo({int pageNumber=1}){
    return homeRepo.getPersonalInfo(
      pageNumber: pageNumber
    );
   }
}