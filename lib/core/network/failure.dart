class Failure {
  const Failure(
    this.message, {
    this.statusCode,
  });

  final String message;
  final String? statusCode;
}
