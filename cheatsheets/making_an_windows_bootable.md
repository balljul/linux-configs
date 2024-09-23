# Creating a Windows 11 Boot USB on Debian

This guide will walk you through the process of creating a bootable Windows 11 USB drive using Debian Linux.

## Prerequisites

- A Debian-based Linux distribution
- A USB drive with at least 8GB capacity
- Administrator (sudo) privileges

## Steps

### 1. Download Windows 11 ISO

1. Visit the official Microsoft Windows 11 download page.
2. Download the Windows 11 ISO file.

### 2. Install Required Tools

Open your terminal and run:

```bash
sudo apt update
sudo apt install wimtools genisoimage
```

### 3. Prepare USB Drive

1. Connect your USB drive.
2. Identify the drive:
   ```bash
   lsblk
   ```
   Note: Replace `/dev/sdX` with your USB drive path in the following commands.

### 4. Format USB Drive

1. Unmount the drive if mounted:
   ```bash
   sudo umount /dev/sdX*
   ```
2. Format the drive to NTFS:
   ```bash
   sudo mkfs.ntfs -f /dev/sdX
   ```

### 5. Mount Windows ISO

```bash
sudo mkdir /mnt/windows_iso
sudo mount -o loop path/to/windows11.iso /mnt/windows_iso
```

### 6. Copy ISO Contents to USB

```bash
sudo mkdir /mnt/usb
sudo mount /dev/sdX /mnt/usb
rsync  -aP /mnt/windows_iso/* /mnt/usb/
```

### 7. Make USB Bootable

```bash
sudo wimlib-imagex apply /mnt/windows_iso/sources/boot.wim 2 /mnt/usb
```

### 8. Clean Up

```bash
sudo umount /mnt/windows_iso
sudo umount /mnt/usb
```

### 9. Safely Eject USB Drive

1. Ensure all file operations are complete.
2. Run the following command:
   ```bash
   sudo eject /dev/sdX
   ```
   Or use your desktop environment's "Safely Remove" option.

3. Wait for confirmation that it's safe to remove the drive.
4. Physically disconnect the USB drive.

Your USB drive is now a bootable Windows 11 installation medium.

## Note

Always double-check the device path (`/dev/sdX`) before running commands to avoid data loss on wrong devices.
