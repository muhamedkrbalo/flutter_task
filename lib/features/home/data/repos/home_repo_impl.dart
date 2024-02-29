import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_task/features/home/data/data_source/home_local_data_souece.dart';
import 'package:flutter_task/features/home/data/data_source/home_remote_data_source.dart';
import 'package:flutter_task/features/home/domain/entities/personal_info_entity.dart';
import 'package:flutter_task/features/home/domain/repos/home_repo.dart';
import 'package:flutter_task/helpers/error/failures.dart';

class HomeRepoImpl extends HomeRepo{
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;

  HomeRepoImpl({required this.homeRemoteDataSource, required this.homeLocalDataSource});

  @override
  Future<Either<Failure, List<PersonalInfoEntity>>> getPersonalInfo({int pageNumber=1})async {
try {
  List<PersonalInfoEntity> personalInfoList;
   personalInfoList= homeLocalDataSource.getPersonalInfo(
  pageNumber: pageNumber
    );
  if(personalInfoList.isNotEmpty ){
    return right(personalInfoList);
  }
   personalInfoList=  await homeRemoteDataSource.getPersonalInfo(pageNumber: pageNumber);
  
    return right(personalInfoList);
} catch (e) {
  if(e is DioException){
     return left(ServerFailure.fromDioError(e));
  }
  return left(ServerFailure(e.toString()));
  
}
 
  }

}