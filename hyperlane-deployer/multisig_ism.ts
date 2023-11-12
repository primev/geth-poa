// @ts-ignore
import { ChainMap, ModuleType, MultisigIsmConfig } from '@hyperlane-xyz/sdk';

export const multisigIsmConfig: ChainMap<MultisigIsmConfig> = {
  // ----------- Your chains here -----------------
  mevcommitsettlement: {
    type: ModuleType.LEGACY_MULTISIG,
    threshold: 2,
    validators: [
      '0xd9cd8E5DE6d55f796D980B818D350C0746C25b97',
      '0x788EBABe5c3dD422Ef92Ca6714A69e2eabcE1Ee4',
    ],
  },
};
