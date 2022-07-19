# Neofetch do BRUTE
- Versão com os símbolos especiais

![image](https://user-images.githubusercontent.com/70975757/179618592-4972fba2-71f4-46e1-a94e-c4639a30e450.png)

- Versão sem os símbolos especiais

![image](https://user-images.githubusercontent.com/70975757/179618680-e1006bb5-9404-4606-a614-90358ecbce80.png)

1. Instalação
2. Observações
3. Desinstalação

## 1. Instalação
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
## 2. Observações

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

## 3. Desinstalação
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
