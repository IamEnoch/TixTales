//login auth exceptions
class UserNotFoundException implements Exception {}

class WrongPasswordException implements Exception {}

//Register auth exceptions

class EmailAreadyInUseException implements Exception {}

class InvalidEmailException implements Exception {}

class WeakPasswordException implements Exception {}

class UserNotLoggedInException implements Exception {}

class GenericException implements Exception {}
