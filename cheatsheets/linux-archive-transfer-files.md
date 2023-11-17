# Archive and Transfer files

## Table of Contents
- [Overview](#overview)
- [What is tar?](#tar)
- [tar vs gzip](#tar-vs-gzip)
- [gzip vs bzip2 vs xz](#gzip-vs-bzip2-vs-xz)
- [tar operations](#operations)
    - [General Operations](#operations-1)
    - [General Options](#operations-2)
    - [Algorithm Options](#operations-3)
- [Creating an Archive](#creating)
- [Extracting an Archive](#extracting)

<a name="overview"></a>
## Overview
An archives is a single file which contains multiple files/directorys.  
In OpenSource and Linux communities *tarballs* are the most common archives.  

<a name="tar"></a>
## What is tar 
`tar` is short for *tape archive*.  
It is a Gnu cmd tool for extracting and creating archives.  
`tar` can also perfom compression and decompression using tools like `gzip` and `bzip2`

<a name="tar-vs-gzip"></a>
## tar vs gzip
When using Linux you will probably encounter both `tar` and `gzip`.  
The basic difference is the following:
- `tar` => Creates archives
- `gzip` => Compresses files

However these commands can make use of each other.  
`tar` for example can use `gzip` to compress its files before making an archive.  
To use `tar` with `gzip` add the `-z` flag:  

`tar -z path/to/file path/to/save/to`  

<a name="gzip-vs-bzip2-vs-xz"></a>
## gzip vs bzip2 vs xz compression
`tar` can also use `bzip2` and `xz` for compression.  
To use `bzip2` take the `-j` flag.  
For `xz` use the `-J` flag.  

<a name="operations"></a>
## tar operations
<a name="operations-1"></a>
### General Operations
If you want to perform an operation `tar` you need one of the following flags:  
- `-c` `--create` => Creating an archive
- `-t` `--list` => List the contens of an archive
- `-x` `--extract` => Extract an archive

<a name="operations-2"></a>
### General Options
But there are several options you can use:  
- `-v` `--verbose` => shows you which files are currently archived
- `f` `--file` => Follow this option with the archive file name to create or open.
- `-p` `--preserve-permission` => Preserves the original files permission while extracting.  
- `--xattrs` => Enables extended attribute support and stores extrened file attributes
- `--selinux` => Enables SELinux context support and stores SELinux file contexts

<a name="operations-3"></a>
### Algorithm Options
- `-a` `--auto-compress` => Uses the archives sufix to determit the algo to use
- `-z` `--gzip` => Uses the gzip algo for compression. Results in a `.tar.gz` suffix
- `-j` `--bzip2` => Uses the bzip2 algo for compression. Results in a `.tar.bz2` suffix
- `-J` `--xz` => Uses the xz algo for compression. Results in a `.tar.xz` suffix

<a name="creating"></a>
## Creating an Archive
If you want to create an archive you always need to include the `-c` flag.  
Normally you also include the `-f` flag which lets you specify the name of the outputed file.  
Heres an example:  

`tar -cf backup file1.txt file2.txt file3.txt`

In this example I create an archive which has the name backup and contains the files file1.txt, file2.txt and file3.txt.  

Another example would be the following:  

`tar -cjf backup file.txt`

Here we are adding the algorithm option j which means tar compresses the file with gzip before creating an archive.  

<a name="extracting"></a>
## Extracting Archives
