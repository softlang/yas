class FsmlException(Exception):
    # Base class for all FSML exceptions
    pass

class FsmlParseException(FsmlException):
    pass

class FsmlIllegalEventException(FsmlException):
    pass

class FsmlInfeasibleEventException(FsmlException):
    pass

class FsmlOkException(FsmlException):
    # Base class for all FsmlOk exceptions
    pass

class FsmlDistinctIdsException(FsmlOkException):
    pass

class FsmlSingleInitialException(FsmlOkException):
    pass

class FsmlDeterministicException(FsmlOkException):
    pass

class FsmlResolvableException(FsmlOkException):
    pass

class FsmlReachableException(FsmlOkException):
    pass
