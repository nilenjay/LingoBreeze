import 'package:get_it/get_it.dart';
import '../../features/vocabulary/data/datasources/vocabulary_remote_datasource.dart';
import '../../features/vocabulary/data/repositories/vocabulary_repository_impl.dart';
import '../../features/vocabulary/domain/repositories/vocabulary_repository.dart';
import '../../features/vocabulary/domain/usecases/add_word_usecase.dart';
import '../../features/vocabulary/domain/usecases/get_words_usecase.dart';
import '../../features/vocabulary/presentation/bloc/vocabulary_bloc.dart';
import '../network/api_client.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc
  sl.registerFactory(() => VocabularyBloc(
        getWordsUseCase: sl(),
        addWordUseCase: sl(),
      ));

  // Use Cases
  sl.registerLazySingleton(() => GetWordsUseCase(sl()));
  sl.registerLazySingleton(() => AddWordUseCase(sl()));

  // Repository
  sl.registerLazySingleton<VocabularyRepository>(
    () => VocabularyRepositoryImpl(sl()),
  );

  // Data Sources
  sl.registerLazySingleton<VocabularyRemoteDatasource>(
    () => VocabularyRemoteDatasourceImpl(sl()),
  );

  // Core
  sl.registerLazySingleton(() => ApiClient());
}
