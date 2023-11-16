//we will create models for each functionality
// like create user, get user...  Create user will depend on repository
// follows single responsibility principle
import 'package:equatable/equatable.dart';
import 'package:testdrivndevelopment/core/usecase/usecase.dart';
import 'package:testdrivndevelopment/core/utils/typedef.dart';
import 'package:testdrivndevelopment/src/authentication/domain/repository/auth_repos.dart';

class CreateUser extends UsecaseWithParams<dynamic, CreateUserParams> {
  const CreateUser(this._repository);
  final AuthenticationRepo _repository;

  @override
  ResultVoid call(CreateUserParams params) async => _repository.createUser(
        createdAt: params.createdAt,
        name: params.name,
        avatar: params.avatar,
      );
}

class CreateUserParams extends Equatable {
  const CreateUserParams({
    required this.name,
    required this.avatar,
    required this.createdAt,
  });

  const CreateUserParams.empty():
      this(createdAt: '_empty.string',
      name: '_empty.string',
      avatar: '_empty.avatar',
      );

  final String name;
  final String createdAt;
  final String avatar;
  @override
  List<Object?> get props => [name, avatar, createdAt];
}
