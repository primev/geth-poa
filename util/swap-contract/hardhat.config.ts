import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";

const config: HardhatUserConfig = {
  solidity: "0.8.20",
  networks: {
    local: {
      url: "http://127.0.0.1:8545", 
    },
    aws: {
      url: "http://34.215.163.180:8545",
    },
  },
};

export default config;
