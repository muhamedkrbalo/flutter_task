import 'package:flutter_task/features/home/data/models/persona_info_model/personalnfo_model.dart';
import 'package:flutter_task/features/home/domain/entities/personal_info_entity.dart';
import 'package:flutter_task/networking/api_helper.dart';
import 'package:hive/hive.dart';

abstract class HomeRemoteDataSource {
  Future<List<PersonalInfoEntity>> getPersonalInfo({int pageNumber=1});
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {

      @override
      Future<List<PersonalInfoEntity>> getPersonalInfo({int pageNumber=1})async {
 var data = await ApiHelper.instance.get('https://dummyjson.com/users?limit=${pageNumber*10}');
 List<PersonalInfoEntity> personLInfo = getPersonalList(data);
 return personLInfo;
  }

      List<PersonalInfoEntity> getPersonalList(data) {
        List<PersonalInfoEntity> personLInfo=[];
        for(var personalInfoMap in data['users']){
         personLInfo.add(PersonalInfoModel.fromJson(personalInfoMap));
        saveData(personLInfo);
        }
        return personLInfo;
      }

      void saveData(List<PersonalInfoEntity> personLInfo) {
          var box=Hive.box<PersonalInfoEntity>('personal_box');
        box.addAll(personLInfo);
      }
  }
  

  
  
  
