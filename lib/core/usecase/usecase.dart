//some usecases need parameters some don't
//depending on that we write interfaces
import 'package:testdrivndevelopment/core/utils/typedef.dart';

abstract class UsecaseWithParams<Type, Params> {
  const UsecaseWithParams();
  ResultVoid<Type> call(Params params);
}

abstract class UsecaseWithoutParams<Type> {
  const UsecaseWithoutParams();
  ResultFuture<Type> call();
}
