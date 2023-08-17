//Define superc class for all the tickets exceptions
class CloudStorageException implements Exception {
  CloudStorageException();
}

//related exceptions
class CouldNotGetAllTicketsException extends CloudStorageException{}

