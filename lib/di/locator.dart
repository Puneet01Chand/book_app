import 'package:get_it/get_it.dart';
import 'package:new_project/features/search/data/datasource/search_remote_datasource.dart';
import 'package:new_project/features/search/data/repositories/search_repository_impl.dart';
import 'package:new_project/features/search/domain/repositories/search_repository.dart';
import 'package:new_project/features/search/domain/usecases/search_book_use_case.dart';
import 'package:new_project/features/search/presentation/bloc/search_bloc.dart';

final GetIt sl = GetIt.instance; // sl => service locator

Future<void> setupLocator() async {
  // Theme Mode

  /// Data layer

  // Leagues
  sl.registerLazySingleton<SearchRemoteDataSource>(() => SearchRemoteDataSource());
  sl.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(sl<SearchRemoteDataSource>()),
  );

  // Domain layer Use cases
  sl.registerLazySingleton(() => SearchBooksUseCase(sl<SearchRepository>()));

  // Presentation layer Blocs
  sl.registerFactory(() => SearchBloc(searchBooksUseCase: sl<SearchBooksUseCase>()));
}
