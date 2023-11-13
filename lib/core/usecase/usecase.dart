
import 'package:testdrivndevelopment/core/utils/typedef.dart';

abstract class UsecaseWithParams<T, Params> {
  ResultFuture<Type> call(Params params);
}
abstract class UsecaseWithoutParams <Type> {

}