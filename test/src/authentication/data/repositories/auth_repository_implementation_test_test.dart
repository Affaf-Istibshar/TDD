import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testdrivndevelopment/core/errors/exceptions.dart';
import 'package:testdrivndevelopment/core/errors/failure.dart';
import 'package:testdrivndevelopment/src/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:testdrivndevelopment/src/authentication/data/repositories/auth_repository_implementation.dart';

class MockAuthRemoteDataSource extends Mock
    implements AuthenticationRemoteDataSource {
//creation of fake version of dependency
}

//entry point of test (main function)
void main() {
  const createdAt = 'whatever.createdAt';
  const name = 'whatever.name';
  const avatar = 'whatever.avatar';
  late AuthenticationRemoteDataSource remoteDataSource;
  late AuthRepoImplementation repoImplementation;
  setUp(() {
    remoteDataSource = MockAuthRemoteDataSource();
    repoImplementation = AuthRepoImplementation(remoteDataSource);
  });
  group('createUser', () {
    test(
        'should call the [RemoteDataSource.createUser] '
        'and complete successfully', () async {
      //arrange
      //hijacked the value of dependency
      when(() => remoteDataSource.createUser(
              createdAt: any(named: "createdAt"),
              name: any(named: 'name'),
              avatar: any(named: 'avatar')))
          .thenAnswer((_) async => Future.value());

      //act
      final result = await repoImplementation.createUser(
          createdAt: createdAt, name: name, avatar: avatar);
      // Assert
      //got called the same values
      expect(result, equals(const Right(null)));
      verify(() => remoteDataSource.createUser(
          createdAt: createdAt, name: name, avatar: avatar)).called(1);
      verifyNoMoreInteractions(remoteDataSource);
    });
    //scenario no two , exception thrown
    test(
        'should return a [ServerError] when the call to the remote '
        'data source', () async {
      //arrange
      when(() => remoteDataSource.createUser(
              createdAt: any(named: "createdAt"),
              name: any(named: 'name'),
              avatar: any(named: 'avatar')))
          .thenThrow(const ApiException(
              message: 'Unknown error occurred', statusCode: 500));
      //act
      final result = await repoImplementation.createUser(
          createdAt: createdAt, name: name, avatar: avatar);
      expect(
          result,
          equals(const Left(
              ApiFailure(message: 'Unknown error occurred', statusCode: 500))));
    });
    verify(() => remoteDataSource.createUser(createdAt: createdAt, name: name, avatar: avatar)).called(1);
    verifyNoMoreInteractions(remoteDataSource);
  });
}
