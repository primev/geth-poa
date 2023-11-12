// @ts-ignore
import { ChainMap, ChainMetadata, ProtocolType } from '@hyperlane-xyz/sdk';

// import { chainMetadata } from '@hyperlane-xyz/sdk';
// A map of chain names to ChainMetadata
export const chains: ChainMap<ChainMetadata> = {
  // ----------- Your chains here -----------------
  mevcommitsettlement: {
    name: 'mevcommitsettlement',
    protocol: ProtocolType.Ethereum,
    chainId: 17864,
    rpcUrls: [
      {
        http: 'http://bootnode:8545',
      },
    ],
  },
  anvil: {
    name: 'anvil',
    protocol: ProtocolType.Ethereum,
    // anvil default chain id
    chainId: 31337,
    rpcUrls: [
      {
        http: 'http://172.13.0.75:8545',
      },
    ],
  },
};
