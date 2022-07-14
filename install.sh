path=$(pwd)
cd /tmp
git clone https://github.com/BRUTEUdesc/brute-neofetch
mv $HOME/.config/neofetch $HOME/.config/neofetch.bkp
cp -r brute-neofetch/.config/neofetch/ $HOME/.config/neofetch
cd $path
rm -rf /tmp/brute-neofetch
