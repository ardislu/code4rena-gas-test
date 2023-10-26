# code4rena-gas-test

**Update October 2023**: starting in [Solidity 0.8.22](https://github.com/ethereum/solidity/releases/tag/v0.8.22), the `G011` ("Unnecessary checked arithmetic in for loop") gas optimization is [**performed automatically by the `solc` compiler**](https://soliditylang.org/blog/2023/10/25/solidity-0.8.22-release-announcement/)! So the `unchecked` block can be dropped:

```diff
+ for (uint256 i; i < len; ++i) {
- for (uint256 i; i < len; ) {
-   unchecked { ++i; }
}
```

Other gas optimizations remain the same however.

---

A simple smart contract to test the effectiveness of common [code4rena](https://code4rena.com/) [gas optimizations](https://github.com/byterocket/c4-common-issues/blob/main/0-Gas-Optimizations.md/).

Specifically:
- `G001` - Don't Initialize Variables with Default Value
- `G002` - Cache Array Length Outside of Loop
- `G011` - Unnecessary checked arithmetic in for loop
- `G012` - Use Prefix Increment instead of Postfix Increment if possible

Use [Echidna](https://github.com/crytic/echidna) to run the test:

```
echidna GasTest.sol --config echidna.yaml
```
