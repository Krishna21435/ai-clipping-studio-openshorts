"""Windows compatibility shim for fcntl."""
LOCK_EX = 2
LOCK_SH = 1
LOCK_NB = 4
LOCK_UN = 8

def flock(fd, op):
    pass

def fcntl(fd, op, arg=0):
    return 0
