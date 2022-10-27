# Hermes-IBC-Relayer


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
wget https://raw.githubusercontent.com/ToTheMars2/Hermes-IBC-Relayer/main/create_config.sh &&
chmod +x create_config.sh &&
bash ./create_config.sh &&
rm create_config.sh

```

Відновлюємо гаманіці для використання комісії
```
first_mnemonic="" &&
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
