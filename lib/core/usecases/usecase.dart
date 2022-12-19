 import 'package:dartz/dartz.dart';
import 'package:uni_talk/core/error/failure.dart';

abstract class Usecase<Type,Params> {
    Future<Either<Failure,Type>> call(Params params);
}

abstract class Params{

}