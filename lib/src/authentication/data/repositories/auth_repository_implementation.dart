import 'package:dartz/dartz.dart';
import 'package:testdrivndevelopment/core/errors/exceptions.dart';
import 'package:testdrivndevelopment/core/errors/failure.dart';
import 'package:testdrivndevelopment/core/utils/typedef.dart';
import 'package:testdrivndevelopment/src/authentication/data/datasources/auth_remote_datasource.dart';
import 'package:testdrivndevelopment/src/authentication/domain/entities/user.dart';
import 'package:testdrivndevelopment/src/authentication/domain/repository/auth_repos.dart';

class AuthRepoImplementation implements AuthenticationRepo {
  const AuthRepoImplementation(this._remoteDataSource);
  final AuthenticationRemoteDataSource _remoteDataSource;
  //Principle of Dependency inversion..
  @override
  ResultVoid createUser(
      {required String createdAt,
      required String name,
      required String avatar}) async {
    //Test driven development
    //call the remote data source
    //make sure it returns the proper data if there is no exception
    //check if the method returns the proper data
    //check if remote data source throws exception, we return a failure
    // and if not then to return proper expected data
    // final response = http.get();
    //data source
    //final datasource = AuthenticationRemoteDataSource();
    //datasource.createUser(createdAt: createdAt, name: name, avatar: avatar)
    try {
      await _remoteDataSource.createUser(
          createdAt: createdAt, name: name, avatar: avatar);
      return Right(null);
    } on ApiException catch (e) {
      return Left(ApiFailure.fromException(e));
    }
  }

  @override
  ResultFuture<List<User>> getUsers() async {
    // TODO: implement getUsers
    throw UnimplementedError();
  }

  //the contract written in Auth_repo in domain is now implemented here...
}
