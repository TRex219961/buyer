wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip -o ngrok-stable-linux-amd64.zip > /dev/null 2>&1
rm -rf ngrok-stable-linux-amd64.zip
./ngrok authtoken 268tKkixRMBBxHKeBCpS6s72ohm_7UvxkT4VkysGcyKi2JpZN
nohup ./ngrok tcp --region ap 5900 &>/dev/null &
sudo apt-get update && apt-get install qemu -y
sudo apt install qemu-utils -y
sudo apt install qemu-system-x86-xen -y
sudo apt install qemu-system-x86 -y
wget -O windows10.img 'https://www.dropbox.com/s/sb9l1se277htbhg/VPSWin10.img?dl=0'
wget -O win10.iso 'https://dl.malwarewatch.org/windows/mods/Tiny%2010.iso'
wget -O virtio-win.iso 'https://fedorapeople.org/groups/virt/virtio-win/direct-downloads/archive-virtio/virtio-win-0.1.215-1/virtio-win-0.1.215.iso'
clear
curl --silent --show-error http://127.0.0.1:4040/api/tunnels | sed -nE 's/.*public_url":"tcp:..([^"]*).*/\1/p'
sudo qemu-system-x86_64 \
  -m 4G \
  -cpu EPYC \
  -boot order=d \
  -drive file=windows10.img,format=raw,if=virtio \
  -drive file=win10.iso,media=cdrom \
  -drive file=virtio-win.iso,media=cdrom \
  -device usb-ehci,id=usb,bus=pci.0,addr=0x4 \
  -device usb-tablet \
  -vnc :0 \
  -smp cores=2 \
