import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task/features/home/data/repos/home_repo_impl.dart';
import 'package:flutter_task/features/home/domain/entities/personal_info_entity.dart';
import 'package:flutter_task/features/home/domain/use_cases/get_personal_info_use_case.dart';
import 'package:flutter_task/features/home/presentation/controller/get_personal_info_cubit/get_personal_info_cubit.dart';
import 'package:flutter_task/features/splash/spash_screen.dart';
import 'package:flutter_task/helpers/Function/service_locator.dart';
import 'package:flutter_task/helpers/observer/simple_bloc_observer.dart';
import 'package:hive_flutter/adapters.dart';


void main()async {
  await Hive.initFlutter();
  Hive.registerAdapter(PersonalInfoEntityAdapter());
  setupServiceLocator();
await  Hive.openBox<PersonalInfoEntity>('personal_box');
Bloc.observer=SimpleBlocObserver();
  runApp(const MyApp());
 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
      create: (context) => GetPersonalInfoCubit(
          getPersonalInfoUseCase:
              GetPersonalInfoUseCase(homeRepo: getIt.get<HomeRepoImpl>()))
        ..getPersonalInfo(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "Roboto",
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:const SplashScreen()
      ),
    );
  }
}


