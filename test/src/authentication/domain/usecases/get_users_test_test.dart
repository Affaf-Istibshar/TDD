 import 'package:flutter_test/flutter_test.dart';
import 'package:testdrivndevelopment/src/authentication/domain/repository/auth_repos.dart';
import 'package:testdrivndevelopment/src/authentication/domain/usecases/get_users.dart';

import 'authentication_repo.mock.dart';

void main (){
  late AuthenticationRepo repository;
  late GetUsers usecase;

  setUp(() {
   repository = MockAuthenticationRepository();
   usecase = GetUsers(repository);
  });
  test(('Should'), () => null)
 }