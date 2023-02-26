//Define super class for all cloud exceptions
class CloudStorageException implements Exception {
  const CloudStorageException();
}

//create related exception
class CouldNotCreateEventExceptions extends CloudStorageException {}

//read related exception
class CouldNotGetAllEventsException extends CloudStorageException {}

//update related exception
class CouldNotUpdateEventExceptions extends CloudStorageException {}

//delete related exception
class CouldNotDeleteEventExceptions extends CloudStorageException {}
