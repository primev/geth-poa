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
};
