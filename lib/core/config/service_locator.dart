import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../../features/home/data/datasources/local/home_local_datasource.dart';
import '../../features/home/data/datasources/local/home_local_datasource_impl.dart';
import '../../features/home/data/datasources/remote/home_remote_datasource.dart';
import '../../features/home/data/datasources/remote/home_remote_datasource_impl.dart';
import '../../features/home/data/repositories/home_repo.dart';
import '../../features/home/data/repositories/home_repo_impl.dart';
import '../../features/home/presentation/bloc/home_bloc.dart';
import '../../features/search/data/datasources/remote/search/search_remote_datasource.dart';
import '../../features/search/data/datasources/remote/search/search_remote_datasource_impl.dart';
import '../../features/search/data/repositories/search_repo.dart';
import '../../features/search/data/repositories/search_repo_impl.dart';
import '../../features/search/presentation/bloc/search_bloc.dart';
import '../api/api_service.dart';
import '../api/dio_api_service.dart';
import 'connectivity_checker.dart';

final sl = GetIt.instance;

void initServiceLocator() {
  _initCore();
  _initHomeFeature();
  _initSearchFeature();
}

void _initCore() {
  sl.registerLazySingleton<DioApiService>(() => DioApiService(Dio()));

  sl.registerLazySingleton<ApiService>(
    () => sl<DioApiService>(),
  );
  sl.registerLazySingleton<BaseCheckInternetConnectivity>(
    () => CheckInternetConnectivity(),
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
      baseCheckInternetConnectivity: sl<BaseCheckInternetConnectivity>(),
    ),
  );

  sl.registerFactory<HomeBloc>(
    () => HomeBloc(sl<HomeRepo>()),
  );
}

void _initSearchFeature() {
  sl.registerLazySingleton<SearchRemoteDatasource>(
    () => SearchRemoteDatasourceImpl(sl<DioApiService>()),
  );

  sl.registerLazySingleton<SearchRepo>(
    () => SearchRepoImpl(sl<SearchRemoteDatasource>()),
  );

  sl.registerFactory<SearchBloc>(
    () => SearchBloc(sl<SearchRepo>()),
  );
}
