import 'package:hive/hive.dart';
part'personal_info_entity.g.dart';
@HiveType(typeId: 0)
class PersonalInfoEntity {
  @HiveField(0)
  final String? imagePerson;
@HiveField(1)
  final String ?namePerson;
@HiveField(2)
  final String? emailPerson;

  PersonalInfoEntity({required this.imagePerson, required this.namePerson, required this.emailPerson});


}