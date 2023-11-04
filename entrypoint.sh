#!/bin/sh

echo 'password' > /password.txt

# TODO: handle case where account already exists, volume wasn't deleted
OUTPUT=$(geth account new --datadir data --password /password.txt)
ADDRESS=$(echo "$OUTPUT" | awk '/Public address of the key:/ { print $6 }')
echo "New account created with pub addr: $ADDRESS"

# geth account list --datadir data

CLEANED_ADDRESS=$(echo $ADDRESS | sed 's/^0x//' | tr '[:upper:]' '[:lower:]')

# Create the genesis.json file with extradata specified inline
cat > /genesis.json << EOF
{
  "config": {
    "chainId": 12345,
    "homesteadBlock": 0,
    "eip150Block": 0,
    "eip155Block": 0,
    "eip158Block": 0,
    "byzantiumBlock": 0,
    "constantinopleBlock": 0,
    "petersburgBlock": 0,
    "istanbulBlock": 0,
    "berlinBlock": 0,
    "clique": {
      "period": 1,
      "epoch": 30000
    }
  },
  "difficulty": "1",
  "gasLimit": "8000000",
  "extradata": "0x0000000000000000000000000000000000000000000000000000000000000000${CLEANED_ADDRESS}00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
  "alloc": {
    "${CLEANED_ADDRESS}": { "balance": "300000" }
  }
}
EOF

geth init --datadir data /genesis.json

while true
do
        echo "This is an infinite loop"
        sleep 5
done

geth --networkid 17894 dumpconfig > /config.toml

geth --datadir /path/to/data/dir --networkid 1234 --rpc --rpcaddr "0.0.0.0" --rpcport 8545 --rpccorsdomain "*" --rpcapi "eth,net,web3,personal,miner" --allow-insecure-unlock
