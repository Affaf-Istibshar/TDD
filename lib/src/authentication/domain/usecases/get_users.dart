import 'package:testdrivndevelopment/core/usecase/usecase.dart';
import 'package:testdrivndevelopment/core/utils/typedef.dart';
import 'package:testdrivndevelopment/src/authentication/domain/entities/user.dart';
import 'package:testdrivndevelopment/src/authentication/domain/repository/auth_repos.dart';

class GetUsers extends UsecaseWithoutParams<List<User>> {
  const GetUsers(this._repository);
  final AuthenticationRepo _repository;

  @override
  ResultFuture<List<User>> call() async =>
      _repository.getUsers();
}
