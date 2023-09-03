# VM setup for Holesky Testnet

This repository contains scripts for seting up VM for Holesky testnet.

Hardware Requirements:
***16GB RAM, 4-8vCPU, 150GB+ SSD***

OS Requirements: ***Ubuntu 22.04 LTS***, on other releases this set up may not work


### Instructions:

After cloning this repository

`./run_steps.sh` - to set up VM 

This will (steps):
1. updates && upgrades VM and installs necessary packages and tools
2. installs erigon and lighthouse
3. installs staking-deposit-cli for generating validator keys
4. generates validator keys from the mnemonic
5. imports validator keys to lighthouse 

`./erigon.sh` - to start erigon 

`./lighthouse_beacon.sh` - to start lighthouse beacon node

`./lighthouse_validator.sh` - to start lighthouse validator node

### Small Details:

The most crucial part of this set up is to provide correct mnemonic and a correct number of validators to generate validator keys. During *step 4* and *step 5* there will be a promt for ***mnemonic*** and ***number of validators*** (step 4) and ***suggested-fee-recipient***

Mnemonic and number of validators has to be same that was used for generating pub keys. 


## Usefull Links:
- [What is Holesky Testnet?](https://github.com/eth-clients/holesky)
- [Erigon](https://github.com/ledgerwatch/erigon)
- [Lighthouse Validator](https://lighthouse-book.sigmaprime.io/mainnet-validator.html)
- [Suggested Fee Recipient](https://lighthouse-book.sigmaprime.io/suggested-fee-recipient.html)
- [Guide on setting up validators](https://www.coincashew.com/coins/overview-eth/guide-or-how-to-setup-a-validator-on-eth2-mainnet)
- [Staking-deposit-cli](https://github.com/ethereum/staking-deposit-cli)