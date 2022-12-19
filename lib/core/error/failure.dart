import 'package:dartz/dartz.dart';

abstract class Failure{}

class UserAlreadyExistsFailure extends Failure{}
class FirestoreFailure extends Failure{}
class ConnectionFailure extends Failure{}
class LocalFailure   extends Failure{}