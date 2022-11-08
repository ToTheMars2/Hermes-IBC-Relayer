
## Variables

```
Name_bin="hid-noded"
Name_config_file=".hid-node"
Name_service="hypersingd"
```

<b>RPC_PORT</b>( 91, 202)
```
sed -n "91 s/^.*://p" ~/$Name_config_file/config/config.toml | sed -n 's/"$//p'

```

<b>GRPC_PORT</b>(165, 181)
```
sed -n "165 s/^.*://p" ~/$Name_config_file/config/app.toml | sed -n 's/"$//p'

```
