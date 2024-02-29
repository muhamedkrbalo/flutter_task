import 'package:flutter_task/features/home/data/data_source/home_local_data_souece.dart';
import 'package:flutter_task/features/home/data/data_source/home_remote_data_source.dart';
import 'package:flutter_task/features/home/data/repos/home_repo_impl.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(
            homeLocalDataSource: HomeLocalDataSourceImpl(), 
            homeRemoteDataSource:HomeRemoteDataSourceImpl() ));
 
}