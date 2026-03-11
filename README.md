## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
forge script script/TestToken.s.sol:TestTokenScript --rpc-url $RPC --private-key $PRIVATE_KEY --broadcast
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```

```bash
forge verify-contract $ADDRESS --rpc-url $RPC --etherscan-api-key $ETHERSCAN_API_KEY
```

### Local testing using anvil

```bash
# Step 1: Start Anvil
anvil --dump-state data/
```

```bash
# Step 2: Open new terminal and set env vars
export OWNER=0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
export PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
export RPC=http://localhost:8545
```

```bash
# Step 1: Fund the deployer account: 0xE1CB04A0fA36DdD16a06ea828007E35e1a3cBC37
cast send 0xE1CB04A0fA36DdD16a06ea828007E35e1a3cBC37 --rpc-url $RPC --value 1000000000000000000  --private-key $PRIVATE_KEY

# Step 2: Send transaction to deploy Safe singleton factory at address: 0x914d7Fec6aaC8cd542e72Bca78B30650d45643d7
# See: https://github.com/safe-fndn/safe-singleton-factory/blob/main/artifacts/31337/deployment.json
cast publish 0xf8a78085174876e800830186a08080b853604580600e600039806000f350fe7fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe03601600081602082378035828234f58015156039578182fd5b8082525050506014600cf382f4f5a00dc4d1d21b308094a30f5f93da35e4d72e99115378f135f2295bea47301a3165a0636b822daad40aa8c52dd5132f378c0c0e6d83b4898228c7e21c84e631a0b891 --rpc-url $RPC 

# Step 2: Fund Owner: 
cast send $OWNER --rpc-url $RPC --value 1000000000000000000  --private-key $PRIVATE_KEY

# Step 4: Deploy ERC20 token contract
forge script script/TestToken.s.sol:TestTokenScript --rpc-url $RPC --broadcast

# Step 5: Mint tokens 1000 tokens (1000 * 1e18)
export AMOUNT=1000000000000000000000
export OWNER_PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
export TOKEN_ADDRESS=0xf7fed1899f167307216a9c9e3714560195562075
cast send --rpc-url $RPC --private-key $OWNER_PRIVATE_KEY $TOKEN_ADDRESS "mint(address,uint256)" $OWNER $AMOUNT
```


```bash
# Check balance
export USER=0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266
cast call --rpc-url $RPC $TOKEN_ADDRESS "balanceOf(address)" $USER

# Trasfer 
export SENDER_PRIVATE_KEY=0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80
export RECEIVER=0x70997970C51812dc3A010C7d01b50e0d17dc79C8
# Step 5: Send tokens 10 tokens (10 * 1e18)
export AMOUNT_SEND=10000000000000000000
cast send --rpc-url $RPC --private-key $SENDER_PRIVATE_KEY $TOKEN_ADDRESS "transfer(address,uint256)" $RECEIVER $AMOUNT_SEND
```

```bash
### Send to 10000 random addresses
for i in {1..10000}; do RECEIVER="0x$(openssl rand -hex 20)"; cast send --rpc-url $RPC --private-key $SENDER_PRIVATE_KEY $TOKEN_ADDRESS "transfer(address,uint256)" $RECEIVER 1; done
```

### Contract addresses

| **Network** | **Address**                                |  **Owner**                                 | **Link**                                                                        |
|-------------|--------------------------------------------|--------------------------------------------|---------------------------------------------------------------------------------|
| Sepolia     | 0x58e48f88bf943367f05f31164d2943ff4008eec6 | 0x75F64a3B13F36E83a4D02a6775B1bfBd17A26058 | https://sepolia.etherscan.io/address/0x58e48f88bf943367f05f31164d2943ff4008eec6 |
| Mainnet     | 0x58e48f88bf943367f05f31164d2943ff4008eec6 | 0x75F64a3B13F36E83a4D02a6775B1bfBd17A26058 | https://etherscan.io/address/0x58e48f88bf943367f05f31164d2943ff4008eec6 |
| Local       | 0xf7fed1899f167307216a9c9e3714560195562075 | 0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266 |