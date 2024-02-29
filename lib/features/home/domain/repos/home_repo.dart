import 'package:dartz/dartz.dart';
import 'package:flutter_task/features/home/domain/entities/personal_info_entity.dart';
import 'package:flutter_task/helpers/error/failures.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<PersonalInfoEntity>>> getPersonalInfo({int pageNumber=1});
}