import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/home/domain/entities/personal_info_entity.dart';
import 'package:flutter_task/features/home/domain/use_cases/get_personal_info_use_case.dart';

part 'get_personal_info_state.dart';

class GetPersonalInfoCubit extends Cubit<GetPersonalInfoState> {
  GetPersonalInfoCubit({required this.getPersonalInfoUseCase}) : super(GetPersonalInitial());

final GetPersonalInfoUseCase getPersonalInfoUseCase;
  Future<void> getPersonalInfo({int pageNumber=1}) async {
    if(pageNumber==1){
      emit(GetPersonalLoading());
    }else{
      emit(GetPersonalPaginationLoading());
    }
    
  var result =await  getPersonalInfoUseCase.getPersonalInfo(pageNumber: pageNumber);
  result.fold((failure) {
    emit(GetPersonalFailure(errMessage:failure.errMessage));
  }, (r){
    emit(GetPersonalSuccesses(personalInfo: r));
  });
  }
}
