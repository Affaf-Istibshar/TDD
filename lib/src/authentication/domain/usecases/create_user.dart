
//we will create models for each functionality
// like create user, get user...  Create user will depend on repository
// follows single responsibility principle
import 'package:testdrivndevelopment/core/utils/typedef.dart';
import 'package:testdrivndevelopment/src/authentication/domain/repository/auth_repos.dart';

class CreateUser{
   const CreateUser(this._repository);
   final AuthenticationRepo _repository;

   ResultVoid createUser ({
     required String createdAt,
     required String name,
     required String avatar,
   })  async =>
   _repository.createUser(
   createdAt: createdAt,
   name: name,
   avatar: avatar,);
}