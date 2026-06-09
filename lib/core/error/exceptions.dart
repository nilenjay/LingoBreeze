class ServerException implements Exception {
  final String message;
  ServerException([this.message = 'Server error occurred']);
}

class NetworkException implements Exception {
  final String message;
  NetworkException([this.message = 'Network error occurred']);
}

class UnknownException implements Exception {
  final String message;
  UnknownException([this.message = 'An unknown error occurred']);
}
