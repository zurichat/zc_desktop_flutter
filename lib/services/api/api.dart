abstract class Api {
  Future<dynamic> get(Uri uri, {Map<String, dynamic>? queryParameters});

  Future<dynamic> post(
    Uri uri, {
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  });

  Future<dynamic> put(
    Uri uri, {
    required Map<String, dynamic> body,
    Map<String, String>? headers,
  });

  Future<dynamic> delete(Uri uri);
}
