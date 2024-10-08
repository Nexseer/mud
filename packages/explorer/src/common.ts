import { anvil, garnet, redstone } from "viem/chains";

export const supportedChains = { anvil, garnet, redstone } as const;
export type supportedChains = typeof supportedChains;

export type supportedChainName = keyof supportedChains;
export type supportedChainId = supportedChains[supportedChainName]["id"];

export const chainIdToName = Object.fromEntries(
  Object.entries(supportedChains).map(([chainName, chain]) => [chain.id, chainName]),
);

export function validateChainId(chainId: unknown): asserts chainId is supportedChainId {
  if (!(typeof chainId === "number" && chainId in chainIdToName)) {
    throw new Error(`Invalid chain ID. Supported chains are: ${Object.keys(chainIdToName).join(", ")}.`);
  }
}

export function validateChainName(name: unknown): asserts name is supportedChainName {
  if (!(typeof name === "string" && name in supportedChains)) {
    throw new Error(`Invalid chain name. Supported chains are: ${Object.keys(supportedChains).join(", ")}.`);
  }
}
