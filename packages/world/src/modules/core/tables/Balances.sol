// SPDX-License-Identifier: MIT
pragma solidity >=0.8.21;

/* Autogenerated file. Do not edit manually. */

// Import schema type
import { SchemaType } from "@latticexyz/schema-type/src/solidity/SchemaType.sol";

// Import store internals
import { IStore } from "@latticexyz/store/src/IStore.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";
import { StoreCore } from "@latticexyz/store/src/StoreCore.sol";
import { Bytes } from "@latticexyz/store/src/Bytes.sol";
import { Memory } from "@latticexyz/store/src/Memory.sol";
import { SliceLib } from "@latticexyz/store/src/Slice.sol";
import { EncodeArray } from "@latticexyz/store/src/tightcoder/EncodeArray.sol";
import { FieldLayout, FieldLayoutLib } from "@latticexyz/store/src/FieldLayout.sol";
import { Schema, SchemaLib } from "@latticexyz/store/src/Schema.sol";
import { PackedCounter, PackedCounterLib } from "@latticexyz/store/src/PackedCounter.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { RESOURCE_TABLE, RESOURCE_OFFCHAIN_TABLE } from "@latticexyz/store/src/storeResourceTypes.sol";

ResourceId constant _tableId = ResourceId.wrap(
  bytes32(abi.encodePacked(RESOURCE_TABLE, bytes14(""), bytes16("Balances")))
);
ResourceId constant BalancesTableId = _tableId;

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0020010020000000000000000000000000000000000000000000000000000000
);

library Balances {
  /** Get the table values' field layout */
  function getFieldLayout() internal pure returns (FieldLayout) {
    return _fieldLayout;
  }

  /** Get the table's key schema */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _keySchema = new SchemaType[](1);
    _keySchema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_keySchema);
  }

  /** Get the table's value schema */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _valueSchema = new SchemaType[](1);
    _valueSchema[0] = SchemaType.UINT256;

    return SchemaLib.encode(_valueSchema);
  }

  /** Get the table's key names */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "namespaceId";
  }

  /** Get the table's field names */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](1);
    fieldNames[0] = "balance";
  }

  /** Register the table with its config */
  function register() internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Register the table with its config */
  function _register() internal {
    StoreCore.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Register the table with its config (using the specified store) */
  function register(IStore _store) internal {
    _store.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /** Get balance */
  function getBalance(bytes32 namespaceId) internal view returns (uint256 balance) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = namespaceId;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /** Get balance */
  function _getBalance(bytes32 namespaceId) internal view returns (uint256 balance) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = namespaceId;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /** Get balance (using the specified store) */
  function getBalance(IStore _store, bytes32 namespaceId) internal view returns (uint256 balance) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = namespaceId;

    bytes32 _blob = _store.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /** Get balance */
  function get(bytes32 namespaceId) internal view returns (uint256 balance) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = namespaceId;

    bytes32 _blob = StoreSwitch.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /** Get balance */
  function _get(bytes32 namespaceId) internal view returns (uint256 balance) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = namespaceId;

    bytes32 _blob = StoreCore.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /** Get balance (using the specified store) */
  function get(IStore _store, bytes32 namespaceId) internal view returns (uint256 balance) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = namespaceId;

    bytes32 _blob = _store.getStaticField(_tableId, _keyTuple, 0, _fieldLayout);
    return (uint256(bytes32(_blob)));
  }

  /** Set balance */
  function setBalance(bytes32 namespaceId, uint256 balance) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = namespaceId;

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((balance)), _fieldLayout);
  }

  /** Set balance */
  function _setBalance(bytes32 namespaceId, uint256 balance) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = namespaceId;

    StoreCore.setField(_tableId, _keyTuple, 0, abi.encodePacked((balance)), _fieldLayout);
  }

  /** Set balance (using the specified store) */
  function setBalance(IStore _store, bytes32 namespaceId, uint256 balance) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = namespaceId;

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((balance)), _fieldLayout);
  }

  /** Set balance */
  function set(bytes32 namespaceId, uint256 balance) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = namespaceId;

    StoreSwitch.setField(_tableId, _keyTuple, 0, abi.encodePacked((balance)), _fieldLayout);
  }

  /** Set balance */
  function _set(bytes32 namespaceId, uint256 balance) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = namespaceId;

    StoreCore.setField(_tableId, _keyTuple, 0, abi.encodePacked((balance)), _fieldLayout);
  }

  /** Set balance (using the specified store) */
  function set(IStore _store, bytes32 namespaceId, uint256 balance) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = namespaceId;

    _store.setField(_tableId, _keyTuple, 0, abi.encodePacked((balance)), _fieldLayout);
  }

  /** Delete all data for given keys */
  function deleteRecord(bytes32 namespaceId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = namespaceId;

    StoreSwitch.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /** Delete all data for given keys */
  function _deleteRecord(bytes32 namespaceId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = namespaceId;

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /** Delete all data for given keys (using the specified store) */
  function deleteRecord(IStore _store, bytes32 namespaceId) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = namespaceId;

    _store.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /** Tightly pack static data using this table's schema */
  function encodeStatic(uint256 balance) internal pure returns (bytes memory) {
    return abi.encodePacked(balance);
  }

  /** Tightly pack full data using this table's field layout */
  function encode(uint256 balance) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData = encodeStatic(balance);

    PackedCounter _encodedLengths;
    bytes memory _dynamicData;

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /** Encode keys as a bytes32 array using this table's field layout */
  function encodeKeyTuple(bytes32 namespaceId) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = namespaceId;

    return _keyTuple;
  }
}
