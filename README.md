# code4rena-gas-test

A simple smart contract to test the effectiveness of common [code4rena](https://code4rena.com/) [gas optimizations](https://github.com/byterocket/c4-common-issues/blob/main/0-Gas-Optimizations.md/).

Specifically:
- `G001` - Don't Initialize Variables with Default Value
- `G002` - Cache Array Length Outside of Loop
- `G011` - Unnecessary checked arithmetic in for loop
- `G012` - Use Prefix Increment instead of Postfix Increment if possible

Use [Echidna](https://github.com/crytic/echidna) to run the test:

```
echidna-test GasTest.sol --config echidna.yaml
```
