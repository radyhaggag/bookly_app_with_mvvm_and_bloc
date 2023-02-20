abstract class Failure {
  Failure(this.message);

  final String message;
}

class ServerFailure extends Failure {
  ServerFailure(super.message);
}
