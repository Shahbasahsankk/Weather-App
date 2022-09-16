class NoNetworkException{
  final String message;
  NoNetworkException({required this.message});
}
class NoServiceException{
  final String message;
  NoServiceException({required this.message});
}

class ConnectionTimeOutException{
  final String message;
  ConnectionTimeOutException({required this.message});
}

class BadRequestException{
  final String message;
  BadRequestException({required this.message});
}
class UnAuthorizedException{
  final String message;
  UnAuthorizedException({required this.message});
}
class FetchDataException{
  final String message;
  FetchDataException({required this.message});
}