# 🖼️ NFT Collection – Basic & Advanced Implementations

Two ERC-721 implementations built with Foundry:

- Basic, IPFS-hosted metadata/image NFT (`BasicNft`)
- Fully on-chain, dynamic SVG NFT that flips mood (`MoodNft`)

This repo includes deployment scripts, integration/unit tests, and a Makefile for common workflows.

---

## 📦 Requirements

- Foundry (forge/cast/anvil)
  - Install: https://book.getfoundry.sh/getting-started/installation
  - Update: `foundryup`
- An Ethereum RPC URL (for testnet/mainnet tasks)
- A funded private key for live networks (Sepolia recommended)

---

## 📂 Project Structure

```
foundry.toml
Makefile
script/
  DeployBasicNft.s.sol
  DeployMoodNft.s.sol
  Interactions.s.sol
src/
  BasicNFT.sol
  MoodNft.sol
test/
  Integrations/
  Unit/
img/
  happy.svg
  sad.svg
  pug.png
```

---

## 🚀 Quickstart

Install dependencies, build, and run tests:

```bash
forge install
forge build
forge test -vvv
```

Or with the `Makefile` helpers:

```bash
make install
make build
make test
```

Start a local chain in a separate terminal:

```bash
make anvil
```

---

## 🧩 Contracts Overview

- `BasicNft` (src/BasicNFT.sol)
  - Minimal ERC-721 using OpenZeppelin
  - Stores per-token `tokenURI` strings (e.g., IPFS JSON)
  - Deployment script: `script/DeployBasicNft.s.sol`

- `MoodNft` (src/MoodNft.sol)
  - Fully on-chain metadata + SVG image
  - Moods: HAPPY ↔ SAD via `flipMood(tokenId)`
  - Deployment script: `script/DeployMoodNft.s.sol` reads `img/happy.svg` and `img/sad.svg`

---

## 🧪 Testing

```bash
forge test
```

Verbose:

```bash
forge test -vvv
```


> Note: `script/Interactions.s.sol` demonstrates minting for `BasicNft` and currently contains a hardcoded deployed address for convenience. Update it with your deployed address or use `cast` as shown above.

---

## 🖼️ Assets

- `img/happy.svg` and `img/sad.svg` are used by `DeployMoodNft.s.sol` to build on-chain image URIs.
- The repo also includes `img/pug.png` and an example IPFS JSON URI used for `BasicNft`.

---



