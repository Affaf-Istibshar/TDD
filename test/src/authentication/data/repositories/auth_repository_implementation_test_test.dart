

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testdrivndevelopment/src/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:testdrivndevelopment/src/authentication/data/repositories/auth_repository_implementation.dart';

class MockAuthRepoImple extends Mock
implements AuthenticationRemoteDataSource {
//creation of fake version of dependency
}
//entry point of test (main function)
void main () {
  late AuthenticationRemoteDataSource remoteDataSource;
  late AuthRepoImplementation repoImplementation;
  setUp(() {
    repoImplementation = AuthRepoImplementation(remoteDataSource);
  });
}