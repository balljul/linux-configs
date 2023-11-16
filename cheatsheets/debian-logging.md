# Debian Logging Cheatsheet

## Overview
Log files provide a timeline of events for my Linux system and its applications.

## Things you shouldn`t log
- passwords
- Ip Adresses
- Mac Addresses
- Results of Wlan or Bluetooth scans & timestamps
- HTTP Referer
- email subjects (fe. on a mailserver)
- core dumps
- swap space
- file atimes (access counts)

## Kernel Space Logging
The Kernel utilizes a ring buffer to store logs starting from the system boot process.  
Ring bugger means the log has a fixed size.  
Once the buffer runs full new messages will overwrite old messages.  
All messages from the kernel code are stored in this buffer trough the `printk()` function.  
Later on these messages are stored in the permanent storage.  
The Kernel config option `CONFIG_PRINTK` enables the logging trough `printk()`.  
On Debian the command `printk()` can be used via the `dmesg` command.  

## Using the dmesg command

### Displaying all Messages

`sudo dmesg`  

This will print out all logs stored in the Buffer.  
You can also pipe the output into a terminal pager:

```
sudo dmesg | less
sudo dmesg | more
sudo dmesg | tail
```

### Changing Color Format

`sudo dmesg -L`
`sudo dmesg --color=never`

### Display Messages as they arrive

`sudo dmesg --follow`

### Searching for a Specific Term

```
sudo dmesg | grep -i memory
sudo dmesg | grep -i usb
sudo dmesg | grep -i tty
sudo dmesg | grep -i eth
sudo dmesg | grep -i sda
```

We are using the grep command with the -i flag so it *ignores* Switchcases.  
It is also self explainitory what we are searching for in each command.  

```
sudo dmesg | grep -E "memory|usb|tty" 
sudo dmesg | egrep "memory|usb|tty" 
```

Here we are searching for for multiple string with the -E flag (--extended-regexp)

### Clearing dmesg logs

`sudo dmesg -c`

After executing this command the dmesg logs are completely empty.  
Try runnning `sudo dmesg` now. You will see the log is empty.  

### Enable Timestamps in dmesg Logs

`sudo dmesg -H`

The -H flag (--human) produces a human readable output, adds timestamps and pipes it into a pager.  
To make the timestamps even nicer and better readable use the following flag:

`sudo dmesg -T`

The -T flag (--ctime) removes the nanosecond acuracy and formats it nicely.  
Other timeformats can be enables via the `--time-format [format]` flag:  

```
sudo dmesg --time-format=ctime
sudo dmesg --time-format=reltime
sudo dmesg --time-format=delta
sudo dmesg --time-format=notime
sudo dmesg --time-format=iso
```

### Facility Log Types
There are severel types of messages:
- *kern* => Kernel Messages
- *user* => User-level messages
- *mail* => Mail system messages
- *daemon* => Messages about system daemons
- *auth* => Authorization messages
- *syslog* => Internal *syslogd* messages
- *lpr* => Line printer sybsystem messages
- *news* => Network news subsystem messages

You can seperatly address these different types by using the `-f [type]` flag.  

```
sudo dmesg -f syslog
```

The `-f` flag can also take multiple parameters.  

```
sudo dmesg -f syslog,deamon
```

### Filter Log Levels
The dmesg command associates each buffer mesage with a log level.  
The log level characterizes the importance.  
The Levels are:
- emerg => Emergency messages
- alert => Alert requiring immediate action
- crit => Citical conditions
- err => Error messages
- warn => Warning messages
- notice => Normal but significant conditions
- info => Informational messages
- debug => Debugging-level messages

You can filter your dmesg output by log levels using the `-l [level/s]` flag:  

```
sudo dmesg -l info
sudo dmesg -l info,notice
```

### Enabling Facility and Log Level
If you want dmesg to show the Facility and Log Level you can use the `-x` flag:  

`sudo dmesg -x`


## Reading dmesg Log File


