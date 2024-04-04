# Neofetch do BRUTE
- Versão com os símbolos especiais
  
<img width="953" alt="image" src="https://github.com/BRUTEUdesc/brute-neofetch/assets/70975757/ea002a8d-1976-4751-8043-a318b2e02f1c">

- Versão sem os símbolos especiais

<img width="869" alt="image" src="https://github.com/BRUTEUdesc/brute-neofetch/assets/70975757/a02c55bf-b826-4de5-9eb3-5fafcca55614">

1. [Instalação](#Instalação)
2. [Observações](#Observações)
3. [Desinstalação](#Desinstalação)

## Instalação
### Instalação automática
Comando para instalar automaticamente (Linux e MacOS):
```
bash -c "$(curl -fsSL https://raw.github.com/BRUTEUdesc/brute-neofetch/main/install.sh)"
```

### Instalação manual
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

Dependendo da sua situação, use algum dos comandos abaixo:

Copiar os arquivos da configuração com os símbolos especiais (Linux):
```
cp -rT homes/home_nerd_fonts $HOME
```
Copiar os arquivos da configuração com os símbolos especiais (MacOS):
```
cp -R homes/home_nerd_fonts_mac $HOME
```
Copiar os arquivos da configuração sem os símbolos especiais (Linux):
```
cp -rT homes/home_no_nerd_fonts $HOME
```
Copiar os arquivos da configuração sem os símbolos especiais (MacOS):
```
cp -R homes/home_no_nerd_fonts_mac $HOME
```
## Observações

### Não consigo ver os símbolos especiais, e agora?
Caso não consiga ver (mas queira), basta baixar e instalar uma Nerd Font (https://www.nerdfonts.com/font-downloads), e configurar para ela ser a fonte do seu terminal.

### Quero rodar o neofetch sempre que abrir meu terminal.
A opção dada na instalação automática é através da edição dos arquivos de login dos shells (`$HOME/.bashrc` ou `$HOME/.zshrc`), e pode ser feita com algum dos comandos abaixo:

- Bash
```
touch $HOME/.config/neofetch/is_brute_config
cat << EOF >> $HOME/.bashrc

if [[ -f $HOME/.config/neofetch/is_brute_config ]]
then
    neofetch
fi
EOF
```
- ZSH
```
touch $HOME/.config/neofetch/is_brute_config
cat << EOF >> $HOME/.zshrc

if [[ -f $HOME/.config/neofetch/is_brute_config ]]
then
    neofetch
fi
EOF
```

PORÉM, minha preferência pessoal é por editar diretamente no terminal que você usa (gnome-terminal, alacritty, tilix, etc) para rodar o comando `zsh -c "neofetch; zsh"` ou `bash -c "neofetch; bash"` na inicialização do terminal, desta forma o neofetch não será executado quando você abrir o terminal do VScode, ou simplesmente entrar em um novo shell.

## Desinstalação
### Desinstalação automática
Para remover, rode o comando abaixo:
```
bash -c "$(curl -fsSL https://raw.github.com/BRUTEUdesc/brute-neofetch/main/uninstall.sh)"
```
### Desinstalação manual
Basta remover os arquivos em `$HOME/.config/neofetch`:
```
rm -rf $HOME/.config/neofetch
```
E caso haja um backup em `$HOME/.config/neofetch.bkp`, restaure-o:
```
mv $HOME/.config/neofetch.bkp $HOME/.config/neofetch
```

Pode ainda haver trechos do código de inicialização automática do neofetch em seus arquivos de login dos shells (`$HOME/.bashrc` ou `$HOME/.zshrc`). Eles não vão incomodar, mas pode remover se quiser.
