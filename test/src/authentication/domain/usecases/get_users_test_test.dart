 import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:testdrivndevelopment/src/authentication/domain/entities/user.dart';
import 'package:testdrivndevelopment/src/authentication/domain/repository/auth_repos.dart';
import 'package:testdrivndevelopment/src/authentication/domain/usecases/get_users.dart';
import 'package:mocktail/mocktail.dart';
import 'authentication_repo.mock.dart';

void main (){
  late AuthenticationRepo repository;
  late GetUsers usecase;

  setUp(() {
   repository = MockAuthenticationRepository();
   usecase = GetUsers(repository);
  });
  final tResponse = [ User.empty()];

  test(('Should call  the [AuthRepo.getUsers] and it should return lit of users'),
          () async {
    //Arrange
    when(()=> repository.getUsers()).
    thenAnswer((_) async =>  Right(tResponse));
    //Act
        final result = await usecase();
        expect(result, equals( Right<dynamic, List<User>>(tResponse)));
        verify(()=> repository.getUsers()).called(1);
        verifyNoMoreInteractions(repository);

  });
}