import 'package:get_it/get_it.dart';
import 'inject_bloc_dependencies.dart';
import 'inject_datasource_dependencies.dart';
import 'inject_domain_repository_dependencies.dart';
import 'inject_domain_use_case_dependencies.dart';
import 'inject_external_dependencies.dart';

final sl = GetIt.instance;

Future<void> setup() async {
//! Features - Currencies

// Bloc
  await initializeBlocDependencies();

// UseCases
  await initializeDomainUseCaseDependencies();

// Repository

  await initializeDomainRepositoryDependencies();

// DataSources

  await initializeDatasourceDependencies();

//! External
  await initializeExternalDependencies();
}
