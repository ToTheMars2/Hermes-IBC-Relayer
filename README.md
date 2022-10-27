# Hermes-IBC-Relayer

[![Screenshot from 2022-10-27 23-26-36](https://user-images.githubusercontent.com/109024799/198394801-5c4f08da-c41d-4e8f-821a-7fff3d5c6c09.png)](https://github.com/informalsystems/hermes/tree/v1.0.0)


* [Підготовка hermes](https://github.com/ToTheMars2/Hermes-IBC-Relayer/blob/main/README.md#%D0%BF%D1%96%D0%B4%D0%B3%D0%BE%D1%82%D0%BE%D0%B2%D0%BA%D0%B0-hermes)
* [Створення каналу](https://github.com/ToTheMars2/Hermes-IBC-Relayer/blob/main/README.md#%D1%81%D1%82%D0%B2%D0%BE%D1%80%D0%B5%D0%BD%D0%BD%D1%8F-%D0%BA%D0%B0%D0%BD%D0%B0%D0%BB%D1%83)


## Підготовка hermes
Готуємо необхідні директорію

```
cd ~
mkdir -p .hermes

```

Встановлюємо бінарник через cargo([оснання версія](https://github.com/informalsystems/hermes/releases)) 
```
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh #Вибираємо (default)
cargo install ibc-relayer-cli@1.0.0 --bin hermes --locked

```

Створюємо файл `config.toml` ([правильна конфігурація](https://github.com/informalsystems/hermes/blob/v1.0.0/config.toml))
Для цього нам потрібно створити зміні
```
Chain-id_one="" \ 
IP_server_one="" \
RPC_port_one="" \
GRPC_port_one="" \
Prefix_one="" \
Denom_one=""
```

```
Chain-id_two="" \ 
IP_server_two="" \
RPC_port_two="" \
GRPC_port_two="" \
Prefix_two="" \
Denom_two=""
```

Створюємо файл `config.toml` ([правильна конфігурація](https://github.com/informalsystems/hermes/blob/v1.0.0/config.toml))
```
wget https://raw.githubusercontent.com/ToTheMars2/Hermes-IBC-Relayer/main/create_config.sh \
chmod +x create_config.sh \
bash ./create_config.sh \
rm create_config.sh

```

Відновлюємо гаманіці для використання комісії
```
first_mnemonic="" \
second_mnemonic=""
```
```
hermes keys add  --chain cosmoshub-4 --mnemonic-file $( echo "$first_mnemonic" > first_mnemonic && echo "$PWD/first_mnemonic")
hermes keys add  --chain cosmoshub-4 --mnemonic-file $( echo "$second_mnemonic" > first_mnemonic && echo "$PWD/first_mnemonic")
```

Створюємо сервісник
```
sudo tee /etc/systemd/system/hermesd.service > /dev/null <<EOF
[Unit]
Description=hermes
After=network-online.target

[Service]
User=root
ExecStart=which(hermes) start
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
 journalctl -u hermes -f
 
```

## Створення каналу
