//contract
//how a feature works? rules to be written in here

import 'package:dartz/dartz.dart';
import 'package:testdrivndevelopment/core/errors/failure.dart';
import 'package:testdrivndevelopment/core/utils/typedef.dart';

import '../entities/user.dart';

abstract class AuthenticationRepo{
  const AuthenticationRepo();
  //we want to create a user with id,avatar and createdAt
  ResultVoid createUser ({
    required String createdAt,
    required String name,
    required String avatar,
});
  //we want to get list of users
  //fetch a list of users we will get a list of users from server (in future)
  // Future<List<Either<Failure, User>>> getUsers();

  ResultFuture<List<User>> getUsers();

//what if we have some error????
// use to data types either use ist or second Either<(Exception, void)>
}