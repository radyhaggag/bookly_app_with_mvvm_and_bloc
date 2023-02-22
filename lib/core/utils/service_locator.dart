import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/datasources/local/home_local_datasource.dart';
import '../../features/home/data/datasources/local/home_local_datasource_impl.dart';
import '../api/api_service.dart';
import '../api/dio_api_service.dart';
import '../../features/home/data/datasources/remote/home_remote_datasource.dart';
import '../../features/home/data/datasources/remote/home_remote_datasource_impl.dart';
import '../../features/home/data/repositories/home_repo.dart';
import '../../features/home/data/repositories/home_repo_impl.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';
import '../config/connectivity_checker.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  _initCore();
  _initHomeFeature();
}

void _initCore() {
  sl.registerLazySingleton<DioApiService>(() => DioApiService(Dio()));

  sl.registerLazySingleton<ApiService>(
    () => sl<DioApiService>(),
  );
  sl.registerLazySingleton<BaseCheckInternetConnectivity>(
    () => sl<CheckInternetConnectivity>(),
  );
}

void _initHomeFeature() {
  sl.registerLazySingleton<HomeRemoteDatasource>(
    () => HomeRemoteDatasourceImpl(sl<DioApiService>()),
  );
  sl.registerLazySingleton<HomeLocalDatasource>(
    () => HomeLocalDatasourceImpl(),
  );

  sl.registerLazySingleton<HomeRepo>(
    () => HomeRepoImpl(
      homeRemoteDatasource: sl<HomeRemoteDatasource>(),
      homeLocalDatasource: sl<HomeLocalDatasource>(),
      baseCheckInternetConnectivity: sl<CheckInternetConnectivity>(),
    ),
  );

  sl.registerFactory<HomeBloc>(
    () => HomeBloc(sl<HomeRepo>()),
  );
}
