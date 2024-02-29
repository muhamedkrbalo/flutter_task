import 'package:flutter_task/features/home/domain/entities/personal_info_entity.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
 List<PersonalInfoEntity> getPersonalInfo({int pageNumber=1});
}

class HomeLocalDataSourceImpl implements HomeLocalDataSource {
  @override
  List<PersonalInfoEntity> getPersonalInfo({int pageNumber=1}) {
    int startIndex=pageNumber*10;
    int endIndex=(pageNumber +1)*10;
   var box=Hive.box<PersonalInfoEntity>('personal_box');
   int length=box.values.length;
   if(startIndex >=length || endIndex > length){
    return [];
   }
  return box.values.toList();
  }
}