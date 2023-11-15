

import 'package:testdrivndevelopment/src/authentication/data/models/user_model.dart';

abstract class AuthenticationRemoteDataSource {
  //Failure case: throw exceptions, catch them
  //custom exceptions
  Future<void> createUser({
    required String createdAt,
    required String name,
    required String avatar,
  });
  //in remote data sources we never return entities , we return data models
  Future<List<UserModel>> getUsers();
}