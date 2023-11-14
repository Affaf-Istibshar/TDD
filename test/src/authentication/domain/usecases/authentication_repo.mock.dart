
import 'package:mocktail/mocktail.dart';
import 'package:testdrivndevelopment/src/authentication/domain/repository/auth_repos.dart';

//MockAuthenticationRepository this class is the Mock (fake version) of AuthenticationRepo this repository AuthenticationRepo
// is dependency and we have created a fake dependency of it MockAuthenticationRepository

class MockAuthenticationRepository extends Mock implements AuthenticationRepo {}