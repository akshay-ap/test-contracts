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

### Contract addresses

| **Network** | **Address**                                | **Link**                                                                        |
|-------------|--------------------------------------------|---------------------------------------------------------------------------------|
| Sepolia     | 0x46998eD9c160BaE93036A6A94e2a801696f93ad7 | https://sepolia.etherscan.io/address/0x58e48f88bf943367f05f31164d2943ff4008eec6 |