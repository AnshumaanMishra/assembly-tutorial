# Basic Assembly Tutorial:
This repo contains snippets of basic Assembly Language Codes that I have annotated to make them easy to understand
It was more of a personal learning objective, hope this helps.  
[Reference Course](https://youtu.be/gfmRrPjnEw4?si=8yEiFXu6CAvnk5Uv)

## Setting up QEMU ARM VM:
1. Download the OS iso. I am using Raspbian OS Jessie as it is well tested on ARM devices like the Raspberry Pi and has kernel support. [Download it Here](https://downloads.raspberrypi.org/raspbian/images/raspbian-2017-04-10/2017-04-10-raspbian-jessie.zip)
2. I am also using [This Kernel](https://github.com/dhruvvyas90/qemu-rpi-kernel/blob/master/kernel-qemu-4.4.34-jessie)
3. Install `qemu` using
```
sudo apt install qemu-system
```
4. Then run the emulator using 
```
qemu-system-arm \
  -kernel kernel-qemu-4.4.34-jessie \
  -cpu arm1176 \
  -m 256 \
  -M versatilepb \ 
  -serial stdio \
  -append "root=/dev/sda2 rootfstype=ext4 rw" \
  -hda ./2017-04-10-raspbian-jessie.img \
  -nic user,hostfwd=tcp::5022-:22 \
  -no-reboot 
```
Or just use the `run.sh` script with
```
chmod +x ./run.sh
./run.sh
```
5. In the machine, launch terminal and set up ssh using 
```
sudo service ssh start
```
6. Then on your own system, ssh into the machine using
```
ssh pi@127.0.0.1 -p 5022
```
7. Enter `yes` when prompted for the authenticity check and then enter the password `raspberry` to log into the system
8. Now you are all set
