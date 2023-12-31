import 'package:equatable/equatable.dart';
import 'package:testdrivndevelopment/core/errors/exceptions.dart';
//exception cache failure, server failure, local data failure, anything
abstract class Failure extends Equatable {

 const    Failure( {
    required this.message ,
    required this.statusCode,
});
  final String message;
  final int statusCode;
 @override
  List<Object> get props => [message, statusCode];
}
//Data source from servers, local  cache as data source, apis, etc
class ApiFailure extends Failure {
  const ApiFailure({required super.message, required super.statusCode});

  ApiFailure.fromException(ApiException exception) :
      this(message: exception.message , statusCode: exception.statusCode);
}