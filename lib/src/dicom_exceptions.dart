class DicomParseException implements Exception {
  final String message;

  DicomParseException(this.message);

  @override
  String toString() => 'DicomParseException: $message';
}

class DicomFileException extends DicomParseException {
  DicomFileException(super.message);
}

class DicomTagLengthException extends DicomParseException {
  DicomTagLengthException(super.message);
}

class DicomUnexpectedEndException extends DicomParseException {
  DicomUnexpectedEndException(super.message);
}
