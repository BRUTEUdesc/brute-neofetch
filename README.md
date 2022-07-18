# Neofetch do BRUTE

## Instalação automática
Comando para instalar automaticamente (ainda não funciona):
```
bash -c "$(curl -fsSL https://raw.github.com/BRUTEUdesc/brute-neofetch/main/install.sh)"
```

## Instalação manual
Faça backup da sua configuração atual do neofetch com o comando:
```
mv $HOME/.config/neofetch $HOME/.config/neofetch.bkp && mkdir $HOME/.config/neofetch
``` 
Clone o repositório:
```
cd /tmp && git clone https://github.com/BRUTEUdesc/brute-neofetch && cd brute-neofetch
```
Agora teste se você consegue ver os símbolos especiais com o comando:
```
bash -c "$(curl -fsSL https://raw.github.com/BRUTEUdesc/brute-neofetch/main/files/test-nerd-fonts.sh)"
```
Caso não consiga ver (mas queira), basta baixar e instalar uma Nerd Font (https://www.nerdfonts.com/font-downloads), e configurar para ela ser a fonte do seu terminal.


Copiar os arquivos **com** as nerd fonts (Linux):
```
cp -rT homes/home_nerd_fonts $HOME
```
Copiar os arquivos **com** as nerd fonts (MacOS):
```
cp -rT homes/home_nerd_fonts_mac $HOME
```
Copiar os arquivos **sem** as nerd fonts (Linux):
```
cp -rT homes/home_no_nerd_fonts $HOME
```
Copiar os arquivos **sem** as nerd fonts (MacOS):
```
cp -rT homes/home_no_nerd_fonts_mac $HOME
```
