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
Терер потрібно створити файл `config.toml`
Для цього ми створюємо зміні для двох нод
```
Chain-id_one="" \ 
RPC_one="" \
GRPC_one="" \
Prefix_one="" \
denom_one=""

```

```
Chain-id_two="" \
RPC_two="" \
GRPC_two="" \
Prefix_two="" \
denom_two=""

```


