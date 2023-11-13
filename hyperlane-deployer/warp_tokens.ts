// @ts-ignore
import { TokenType } from '@hyperlane-xyz/hyperlane-token';
// @ts-ignore
import type { WarpRouteConfig } from '../src/warp/config';

// A config for deploying Warp Routes to a set of chains
// Not required for Hyperlane core deployments
export const warpRouteConfig: WarpRouteConfig = {
  base: {
    chainName: 'goerli',
    type: TokenType.native, 

    // Optionally specify owner, mailbox, and interchainGasPaymaster addresses
    // If not specified, the Permissionless Deployment artifacts or the SDK's defaults will be used
  },
  synthetics: [
    {
      // Optionally specify a name, symbol, and totalSupply
      // If not specified, the base token's properties will be used
      chainName: 'mevcommitsettlement',
      // Optionally specify owner, mailbox, and interchainGasPaymaster addresses
      // If not specified, the Permissionless Deployment artifacts or the SDK's defaults will be used
    },
  ],
};
