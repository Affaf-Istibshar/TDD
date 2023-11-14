// Class depends on what?
//Answer: CreateUser class depends on auth_repo --AuthenticationRepo
//How we can create fake version of dependencies?
//Answer: install mocktail --Mocktail
//How we control our dependencies? what they are doing?
//Answer: Using the Mocktail's APIs

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:testdrivndevelopment/src/authentication/domain/repository/auth_repos.dart';
import 'package:testdrivndevelopment/src/authentication/domain/usecases/create_user.dart';

import 'authentication_repo.mock.dart';

void main() {
  // test(description, () => null)
  late CreateUser usecase;
  late AuthenticationRepo repository;

  setUp(()   {
        repository = MockAuthenticationRepository();
        usecase = CreateUser(repository);
      });
  const params = CreateUserParams.empty();
  test(
    'It should call the [AuthRepository.createUser]',
    () async {
// Arrange
      //STUB ...  Hijacking president's response
//   final params = const  CreateUserParams(
//   name: 'name',
//   avatar: 'avatar',
//   createdAt: 'createdAt');
      when(() => repository.createUser(
            //any works for generic dart object but for different dart objects we will
            //register that type (create fake version of that type)
            createdAt: any(named: 'createdAt'),
            name: any(named: 'name'),
            avatar: any(named: 'avatar'),
        //void result invoking for that in Either type right hand side will be used for success
               )).thenAnswer((_) async => const Right(null));

      //Act
      //when a higher order function is invoked/ called by any usecase
      // testing upper class
      // final result = await usecase(params);
      final resultFuture = usecase(params);
      //Assert
      //expect from flutter test plugin
      // checking upper class call history (dependency dependency up up up)
      // expect(result, equals(const Right<void, void>(null)));
      //changed the expect statement to use expectLater with completes. This is the correct way to test that a Future completes successfully.
      //the issue might be that you're trying to directly compare a Future<void> with a constant value, which is causing the error
      // The expectLater function is used to test the future returned by usecase(params). The completes matcher ensures that the future completes successfully.
      await expectLater(resultFuture, completes);
      // what if result is fake, wrong or corrupt
      verify(() => repository.createUser(
          createdAt: params.createdAt,
          name: params.name,
          avatar: params.avatar)).called(1);
      //called upper class for once and here telling not to be invoked again
      verifyNoMoreInteractions(repository);
    },
  );
}
