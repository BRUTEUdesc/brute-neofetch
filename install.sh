path=$(pwd)
cd /tmp
git clone https://github.com/BRUTEUdesc/brute-neofetch
mv $HOME/.config/neofetch $HOME/.config/neofetch.bkp
cp -rT brute-neofetch/home/ $HOME/
cd $path
rm -rf /tmp/brute-neofetch
