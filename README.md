# Hermes-IBC-Relayer

[![Screenshot from 2022-10-27 23-26-36 (1)](https://user-images.githubusercontent.com/109024799/198398874-429c89dd-70d0-43e6-98c6-65279ace8de9.png)
](https://github.com/informalsystems/hermes/tree/v1.0.0)


* [Підготовка hermes](https://github.com/ToTheMars2/Hermes-IBC-Relayer/blob/main/README.md#%D0%BF%D1%96%D0%B4%D0%B3%D0%BE%D1%82%D0%BE%D0%B2%D0%BA%D0%B0-hermes)
* [Створення каналу](https://github.com/ToTheMars2/Hermes-IBC-Relayer/blob/main/README.md#%D1%81%D1%82%D0%B2%D0%BE%D1%80%D0%B5%D0%BD%D0%BD%D1%8F-%D0%BA%D0%B0%D0%BD%D0%B0%D0%BB%D1%83)


## Підготовка hermes
Готуємо необхідні директорію

```
cd ~
mkdir -p .hermes

```

Встановлюємо cargo
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh #Вибираємо (default)

```

Встановлюємо бінарник через cargo([оснання версія](https://github.com/informalsystems/hermes/releases)) 
```
cargo install ibc-relayer-cli@1.0.0 --bin hermes --locked

```

Створюємо файл `config.toml` ([правильна конфігурація](https://github.com/informalsystems/hermes/blob/v1.0.0/config.toml))
Для цього нам потрібно створити зміні
```
wget -P ~/.hermes https://raw.githubusercontent.com/ToTheMars2/Hermes-IBC-Relayer/main/change.sh &&
nano ~/.hermes/change.sh

```

Створюємо файл `config.toml` ([правильна конфігурація](https://github.com/informalsystems/hermes/blob/v1.0.0/config.toml))
```
bash ~/.hermes/change.sh
wget https://raw.githubusercontent.com/ToTheMars2/Hermes-IBC-Relayer/main/create_config.sh && 
chmod +x create_config.sh && 
bash ./create_config.sh && 
rm create_config.sh ~/change.sh

```


Провірка вашого конфігу
```
hermes health-check

```
[Виправення помилок]()


Відновлюємо гаманіці для використання комісії
```
first_mnemonic="" \
second_mnemonic=""
```
```
hermes keys add  --chain $Chain_id_one --mnemonic-file $( echo "$first_mnemonic" > mnemonic && echo "$PWD/mnemonic")
hermes keys add  --chain $Chain_id_two --mnemonic-file $( echo "$second_mnemonic" > mnemonic && echo "$PWD/mnemonic")
rm mnemonic

```

Створюємо сервісник
```
sudo tee /etc/systemd/system/hermesd.service > /dev/null <<EOF
[Unit]
Description=hermes
After=network-online.target

[Service]
User=root
ExecStart=$(which hermes) start
Restart=on-failure
RestartSec=3
LimitNOFILE=65535

[Install]
WantedBy=multi-user.target
EOF
```

Запуск сервісника
```
systemctl enable hermesd
systemctl start hermesd

```

Провірка логів
```
journalctl -u hermesd -f
 
```

## Створення каналу


## Загальні знання

Надсилання токенів по каналу
```
hid-noded tx ibc-transfer transfer transfer channel-10 <uptick1....> 10uhid --from <wallet-name> --chain-id="jagrat"  --fees 4000uhid --node http://localhost:<port>
```
