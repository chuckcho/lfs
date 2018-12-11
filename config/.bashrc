#4.4. Setting Up the Environment

# Set +h command turns off bash's hash function. Hashing is ordinarily a useful
# feature—bash uses a hash table to remember the full path of executable files
# to avoid searching the PATH time and again to find the same executable.
# However, the new tools should be used as soon as they are installed. By
# switching off the hash function, the shell will always search the PATH when a
# program is to be run. As such, the shell will find the newly compiled tools in
# $LFS/tools as soon as they are available without remembering a previous
# version of the same program in a different location.
set +h

# Setting the user file-creation mask (umask) to 022 ensures that newly created
# files and directories are only writable by their owner, but are readable and
# executable by anyone (assuming default modes are used by the open(2) system
# call, new files will end up with permission mode 644 and directories with mode
# 755).
umask 022
