# DIX Contracts
This project contains the smart contracts for the Decentralizied Impact Exchange.

## Installation:
Install dapp tools by following the instructions on (https://dapp.tools/)

Remember to export the dapp testnet variables
```
export ETH_GAS=40000000
export ETH_RPC_PORT=2000
export ETH_FROM=$(cat ~/.dapp/testnet/2000/config/account)
```

## Build:
To build the smart contacts using the dapp tools
```
dapp build
```

## Test:
To run the tests for the smart contracts

Run the dapp testnet (https://medium.com/dapphub/easy-local-testnets-for-your-dapp-b9786ca80c88)

```
dapp testnet
```
Make sure that it starts on port 2000 if not then remove the testnet folder for port 2000
```
rm -rf /Users/cedricfranz/.dapp/testnet/2000
```


Run the tests

```
dapp test
```
