# Archive and Transfer files

## Table of Contents
- [Overview](#overview)
- [tar and compression algorithms](#tar-and-more)
    - [What is tar?](#tar)
    - [tar vs gzip](#tar-vs-gzip)
    - [gzip vs bzip2 vs xz](#gzip-vs-bzip2-vs-xz)
- [tar operations](#operations)
    - [General Operations](#operations-1)
    - [General Options](#operations-2)
    - [Algorithm Options](#operations-3)
- [tar usage](#usage)
    - [Creating an Archive](#creating)
    - [Extracting an Archive](#extracting)
    - [Listing archive content](#listing)
    - [Creating a compressed Archive](#creating-compressed)
- [SFTP](#sftp)
    - [Overview](#overview-2)
    - [Usage](#usage)
    - [Commands](#commands)
        - [Put](#sftp-commands-put)
        - [Get](#sftp-commands-get)
- [Secure Copy Protocol](#scp)
- [Rsync](#rsync)
    - [Overview](#rsync-overview)
    - [Usage](#rsync-usage)
    - [Basic Options](#rsync-options-basic)
    - [Advanced Options](#rsync-options-advanced)
    - [Examples](#rsync-examples)
    - [Iportant Things](#rsync-important)
- [Epilogue](#epilogue)

<a name="overview"></a>
## Overview
An archives is a single file which contains multiple files/directorys.  
In OpenSource and Linux communities *tarballs* are the most common archives.  

<a name="tar-and-more"></a>
## tar and compression algorithms

<a name="tar"></a>
### What is tar 
`tar` is short for *tape archive*.  
It is a Gnu cmd tool for extracting and creating archives.  
`tar` can also perfom compression and decompression using tools like `gzip` and `bzip2`

<a name="tar-vs-gzip"></a>
### tar vs gzip
When using Linux you will probably encounter both `tar` and `gzip`.  
The basic difference is the following:
- `tar` => Creates archives
- `gzip` => Compresses files

However these commands can make use of each other.  
`tar` for example can use `gzip` to compress its files before making an archive.  
To use `tar` with `gzip` add the `-z` flag:  

`tar -z path/to/file path/to/save/to`  

<a name="gzip-vs-bzip2-vs-xz"></a>
### gzip vs bzip2 vs xz compression
`tar` can also use `bzip2` and `xz` for compression.  
To use `bzip2` take the `-j` flag.  
For `xz` use the `-J` flag.  

You may be wondering what the difference between those methods is:
- `gzip` compression is the earlier, fastest method and is widely avaible across platforms
- `bzip2` compression creates smaller archives but is less widely avaible than `gzip`
- `xz` compression is newer and offers the best compression ratio of the available methods

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

<a name="usage"></a>
## Tar usage
<a name="creating"></a>
### Creating an Archive
If you want to create an archive you always need to include the `-c` flag.  
Normally you also include the `-f` flag which lets you specify the name of the outputed file.  
Heres an example:  

`tar -cf backup file1.txt file2.txt file3.txt`

In this example I create an archive which has the name backup and contains the files file1.txt, file2.txt and file3.txt.  

<a name="extracting"></a>
### Extracting Archives
To extract a archive we must use the `-x` flag.  

`tar -xf /path/to/archive`

In this example we are using the `-x` flag and then append the `-f / --file` flag which lets us define which archive to extract.  

It is also important to note that the file permissions and user groups dont always get preserved when extracting.  
If a sudo user extracts it the permission are automaticly preserved.  
If a normal user does the same the permission are not preserved.  
If a user still wants the permissions to be preserved he can use the `-p` `--preserve-permission` flag.  
Here is an example:  

`tar -xpf path/to/archive.tar`

<a name="listing"></a>
### Listing archive content
If you want to see which files are inside of an archive we can use the `-t` flag:  

`tar -tf /path/to/archive`

<a name="creating-compressed"></a>
### Creating an compressed archive
As we learned in the chapter [gzip vs bzip2 vs xz](#gzip-vs-bzip2-vs-xz-compression) there are different compression algorithms.  
I personally preffer to use the xz algo because it is said to be the best.  
Now, to create a compressed archive just add the coresponding flag.  
In my example that would be the `-J` or `--xz` flag:  
`tar -cJf backup.tar.xz file1.txt file2.md file3.log file4.sh`

<a name="extracting-compressed"></a>
### Extracting compressed archives
When it comes to extracting an compressed archive there are two possible options.  
Firstly you could just use the `-a` `--auto-compress` flag which determits the decompression algo by looking at the file suffix.  
The problem is that you could have files which dont have a valid suffix or dont even have on.  
In this case you can use flags to determit which algo should be used.  
We already learned about them in the chapter [Alorithm Options](#operations-3).  
Here are some examples on how to use them:  

```
tar -xaf file.tar.xz
tar -xzf file.tar.xz
tar -xjf file.tar.xz
tar -xJf file.tar.xz
```
<a name="sftp"></a>
## Sftp
<a name="sftp-overview"></a>
### Overview
SFTP is part of the OpenSSH Suite and is used to interactivly upload/download files to/from a remote server.  
A session via the `sftp` command used the *secure athentification mechanism* to encrypt data transfer to/from the ssh server.  

<a name="sftp-usage"></a>
### Usage
To use SFTP you need to enter the `sftp` command combined wiht the username and addresses of the remote host.  
Here is an example:  

`sftp balljul@192.168.25.3`
or
`sftp julius@julius`

For testing out sftp the first time you can also connect to your current mashine by using the credentials which are in your terminal.  


<a name="sftp-commands"></a>
### Commands
When you succesfully connect you to a session you can use various commands which you should know already:
- `pwd`
- `lpwd`
- `ls`
- `mkdir`
- `chmod`

You might wonder what the difference between pwd and lpwd is.  
`pwd` gives you the working dir of the maching you are connected to.  
`lpwd` gives you the working dir of your local machine.  

There are also some commands which are new:  
- `put` => Uploading files to the remote host
- `get` => Downloading files from the remote host

<a name="sftp-commands-put"></a>
#### The put command
The put command let your upload files to the remote host like this:  

`put [options] <local-path> [remote-path]`

The local path is required, but you can, as you see, also define the remote path, to define where the file should 
be saved on the remote machine.  

There are also several options avaible:
- `-r` => If you want to upload a folder
- `-P` => Specifies the port on a server
- `-o` => Allows you to specify options in the format used by the ssh client

<a name="sftp-commands-get"></a>
#### The get command
The get command lets you download files from the remote host like this:  

`get [options] <remote-path> [local-path]`  

With the get command the remote path is required, but you can also specify a local path for the download.  

The options are the same as those of the put command:
- `-r` => For downloading a whole directory
- `-P` => For specifying the port
- `-o` => For specifying the format used by the ssh client

<a name="scp"></a>
## Secure Copy Protocol (scp)
The `scp` command is based on the `rcp` command which wasn´t designed with security in mind.  
Since there are still many vulnabilities many linux distributions use `sftp` or `rsync` for that matter.  

<a name="rsync"></a>
## Rsync
<a name="rsync-overview"></a>
### Overview
`rsync` allows you to synchronyze files between two hosts.  
It minimyzes the copied data by only transfering files that have been changed.  
It also is way more secure than `scp` and as mentioned also substentionally faster.  

<a name="rsync-usage"></a>
### Usage
The arguments of the rsync command look as following:  

`rsync [option] source destination`

As you can see options are again optional.  
The source and destination path are required.  

<a name="rsync-options-basic"></a>
### Basic Options
The options relativly easy to remember and look as followed:  
- `-r` `--recursive`=> Recursive copying for syncing a folder
- `-l` `--links`=> Syncing a symbolic link (File/Folder that points to another file/folder)
- `-p` `--perms`=> For preserving permissions of the synced content
- `-t` `--times` => For Preserving timestamps
- `-g` `--group` => For preserving group ownerships
- `-o` `-owner` => For preserving the owner of the files
- `-D` `--devices` => For preserving device files


<a name="rsync-options-advanced"></a>
### Advanced options
There are also some options whihc are very helpfull when syncing:  
- `-n` => **Simulates** what would happen if you executed the command
- `-v` `--verbose` => Provides more information about the process
- `-a` `--archive` => Enables all basic options and therefore preserves lots of information

<a name="rsync-examples"></a>
### Usage examples
The following examples will give more clarity on how to use the rsync utility.  

```
rsync -avn /path/to/important/folder/ 192.168.16.12:/home/usr/Documents/
rsync -av /path/to/important/folder/ 192.168.16.12:/home/usr/Documents/
```

In this example we do a dry run at first (using the `-n` flag) to see if everything would go right, 
then we execute the command and it syncs the local folder into the remote host`s Documents folder.  

```
rsync -avn 192.168.16.12:/path/to/important/folder/ /tmp/
rsync -av 192.168.16.12:/path/to/important/folder/ /tmp/
```

Here we do the same as before, but insted of syncing something to the remote host we
sync a folder from the remote host onto our system.  

<a name="rsync-important"></a>
### Important Things
Correctly specifying a source directory trailing slash is important. 
A source directory with a trailing slash synchronizes the contents of the directory without including 
the directory itself. The contents are synced directly into the destination 
directory. Without the trailing slash, the source directory itself 
will sync to the destination directory. The source directory's contents are 
in the new subdirectory in the destination.


<a name="epilogue"></a>
## Epilogue

> **Julius Ball**  
> **contact@juliusball.com**  
>  
> **[My Website](https://www.juliusball.com)**  
> **[Github](https://www.github.com/balljul)**  
> **[Linkedin](https://www.linkedin.com/in/juliusball/)** 
