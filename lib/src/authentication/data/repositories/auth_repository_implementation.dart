import 'package:testdrivndevelopment/core/utils/typedef.dart';
import 'package:testdrivndevelopment/src/authentication/domain/entities/user.dart';
import 'package:testdrivndevelopment/src/authentication/domain/repository/auth_repos.dart';

class AuthRepoImplementation implements
    AuthenticationRepo {
  //Principle of Dependency inversion
  @override
  ResultVoid createUser(
      {required String createdAt,
      required String name,
      required String avatar}) async {
    // final response = http.get();
    //data source

  }

  @override
  ResultFuture<List<User>> getUsers() async {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

  //the contract written in Auth_repo in domain is now implemented here...
}
