Gotchi Care contract functions:
- [x] srcipts/gotchi_care.py - interacts your gotchis without using GUI (required private key in the .env)
  - [ ] Run it on raspberry
- [] contracts/GotchiCare.sol - interacts your gotchis via smart contract (You will have to deposit your Gotchis into that smart contract but it will be interacting without exposure of your private keys)
  - [x] ERC20 token which represents days left for interacting (fixed relation comparing to native token)
  - [ ] Create gotchi vault. Gotchis inside the vault will be interacted and the owner can always withdraw the gotchi from the vault
  - [ ] Build an option to connect it with Gelato or Chainlink Keepers and another option to run on raspberry (py script)