
## Variables

```
Name_bin="hid-noded"
Name_config_file=".hid-node"
Password_keys="198273495"
```

<b>RPC_PORT</b>( 91, 202)
```
sed -n "91 s/^.*://p" ~/$Name_config_file/config/config.toml | sed -n 's/"$//p'

```

<b>GRPC_PORT</b>(165, 178)
```
sed -n "165 s/^.*://p" ~/$Name_config_file/config/app.toml | sed -n 's/"$//p'

```

<b>Prefix</b>
```
echo $Password_keys | $Name_bin keys list | sed -n 3p | sed  "s/^.*: //"
```

<b>Denom</b>
```

```
