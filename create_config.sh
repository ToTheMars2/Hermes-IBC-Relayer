
echo "[global]
log_level = 'info'
[mode]
[mode.clients]
enabled = true
refresh = true
misbehaviour = true
[mode.connections]
enabled = false
[mode.channels]
enabled = false
[mode.packets]
enabled = true
clear_interval = 100
clear_on_start = true
tx_confirmation = true
[rest]
enabled = true
host = '0.0.0.0'
port = 3000
[telemetry]
enabled = true
host = '0.0.0.0'
port = 3001

[[chains]]
id = '$Chain_id_one'
rpc_addr = 'http://$IP_server_one:$RPC_port_one'
grpc_addr = 'http://$IP_server_one:$GRPC_port_one'
websocket_addr = 'ws://$IP_server_one:$RPC_port_one/websocket'
rpc_timeout = '10s'
account_prefix = '$Prefix_one'
key_name = 'testkey'
store_prefix = 'ibc'
default_gas = 100000
max_gas = 400000
gas_price = { price = 0.001, denom = '$Denom_one' }
gas_multiplier = 1.1
max_msg_num = 30
max_tx_size = 2097152
clock_drift = '5s'
max_block_time = '30s'
trusting_period = '14days'
trust_threshold = { numerator = '1', denominator = '3' }
address_type = { derivation = 'cosmos' }

[[chains]]
id = '$Chain_id_two'
rpc_addr = 'http://$IP_server_two:$RPC_port_two'
grpc_addr = 'http://$IP_server_two:$GRPC_port_two'
websocket_addr = 'ws://$IP_server_two:$RPC_port_two/websocket'
rpc_timeout = '10s'
account_prefix = '$Prefix_two'
key_name = 'testkey'
store_prefix = 'ibc'
default_gas = 100000
max_gas = 400000
gas_price = { price = 0.001, denom = '$Denom_two' }
gas_multiplier = 1.1
max_msg_num = 30
max_tx_size = 2097152
clock_drift = '5s'
max_block_time = '30s'
trusting_period = '14days'
trust_threshold = { numerator = '1', denominator = '3' }
address_type = { derivation = 'cosmos' }
" > $HOME/.hermes/config.toml

sed -i '/Chain_id\|IP_server\|RPC_port\|GRPC_port\|Prefix\|Denom/d' $HOME/.bash_profile
source $HOME/.bash_profile
