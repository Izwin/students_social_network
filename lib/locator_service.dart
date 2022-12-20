import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uni_talk/core/platform/network_info.dart';
import 'package:uni_talk/features/login/data/data_sources/local_repository.dart';
import 'package:uni_talk/features/login/data/repositories/user_repository_impl.dart';
import 'package:uni_talk/features/login/domain/repositories/user_repository.dart';
import 'package:uni_talk/features/login/domain/use_cases/register.dart';
import 'package:uni_talk/features/login/presentation/bloc/register_bloc/register_bloc.dart';

import 'features/login/data/data_sources/firebase_datasource.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Blocs
  sl.registerFactory(() => RegisterBloc(registerUseCase: sl()));
  // UseCases
  sl.registerLazySingleton<RegisterUseCase>(() => RegisterUseCase(userRepository: sl()));
  // Repositories
  sl.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
      firebaseRepository: sl(), localRepository: sl(), networkInfo: sl()));
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(firebaseFirestore: sl()));
  sl.registerLazySingleton<LocalRepository>(
      () => LocalRepositoryImpl(sharedPreferences: sl()));
  // Core
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(internetConnectionChecker: sl()));

  //External

  var sharedPreferences = await SharedPreferences.getInstance();

  sl.registerLazySingleton<InternetConnectionChecker>(
      () => InternetConnectionChecker());

  sl.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  sl.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
}
