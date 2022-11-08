
## Variables

```
Name_bin="hid-noded"
Name_config_file=".hid-node"
Name_service="hypersingd"
```

RPC_PORT( 91, 202)
```
sed -n "91 s/^.*://p" ~/$Name_config_file/config/config.toml | sed -n 's/"$//p'

```

GRPC_PORT(165, 181)
```
sed -n "165 s/^.*://p" ~/$Name_config_file/config/app.toml | sed -n 's/"$//p'

```
