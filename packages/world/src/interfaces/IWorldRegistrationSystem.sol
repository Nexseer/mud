// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { ISystemHook } from "./ISystemHook.sol";
import { WorldContextConsumer } from "./../WorldContext.sol";

interface IWorldRegistrationSystem {
  function registerNamespace(ResourceId namespaceId) external;

  function registerSystemHook(ResourceId systemId, ISystemHook hookAddress, uint8 enabledHooksBitmap) external;

  function unregisterSystemHook(ResourceId systemId, ISystemHook hookAddress) external;

  function registerSystem(ResourceId systemId, WorldContextConsumer system, bool publicAccess) external;

  function registerFunctionSelector(
    ResourceId systemId,
    string memory systemFunctionName,
    string memory systemFunctionArguments
  ) external returns (bytes4 worldFunctionSelector);

  function registerRootFunctionSelector(
    ResourceId systemId,
    bytes4 worldFunctionSelector,
    bytes4 systemFunctionSelector
  ) external returns (bytes4);

  function registerDelegation(address delegatee, ResourceId delegationControlId, bytes memory initCallData) external;
}
