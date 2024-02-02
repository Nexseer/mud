// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

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

FieldLayout constant _fieldLayout = FieldLayout.wrap(
  0x0000000100000000000000000000000000000000000000000000000000000000
);

library KeysWithValue {
  /**
   * @notice Get the table values' field layout.
   * @return _fieldLayout The field layout for the table.
   */
  function getFieldLayout() internal pure returns (FieldLayout) {
    return _fieldLayout;
  }

  /**
   * @notice Get the table's key schema.
   * @return _keySchema The key schema for the table.
   */
  function getKeySchema() internal pure returns (Schema) {
    SchemaType[] memory _keySchema = new SchemaType[](1);
    _keySchema[0] = SchemaType.BYTES32;

    return SchemaLib.encode(_keySchema);
  }

  /**
   * @notice Get the table's value schema.
   * @return _valueSchema The value schema for the table.
   */
  function getValueSchema() internal pure returns (Schema) {
    SchemaType[] memory _valueSchema = new SchemaType[](1);
    _valueSchema[0] = SchemaType.BYTES32_ARRAY;

    return SchemaLib.encode(_valueSchema);
  }

  /**
   * @notice Get the table's key field names.
   * @return keyNames An array of strings with the names of key fields.
   */
  function getKeyNames() internal pure returns (string[] memory keyNames) {
    keyNames = new string[](1);
    keyNames[0] = "valueHash";
  }

  /**
   * @notice Get the table's value field names.
   * @return fieldNames An array of strings with the names of value fields.
   */
  function getFieldNames() internal pure returns (string[] memory fieldNames) {
    fieldNames = new string[](1);
    fieldNames[0] = "keysWithValue";
  }

  /**
   * @notice Register the table with its config.
   */
  function register(ResourceId _tableId) internal {
    StoreSwitch.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Register the table with its config.
   */
  function _register(ResourceId _tableId) internal {
    StoreCore.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Register the table with its config (using the specified store).
   */
  function register(IStore _store, ResourceId _tableId) internal {
    _store.registerTable(_tableId, _fieldLayout, getKeySchema(), getValueSchema(), getKeyNames(), getFieldNames());
  }

  /**
   * @notice Get keysWithValue.
   */
  function getKeysWithValue(
    ResourceId _tableId,
    bytes32 valueHash
  ) internal view returns (bytes32[] memory keysWithValue) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /**
   * @notice Get keysWithValue.
   */
  function _getKeysWithValue(
    ResourceId _tableId,
    bytes32 valueHash
  ) internal view returns (bytes32[] memory keysWithValue) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /**
   * @notice Get keysWithValue (using the specified store).
   */
  function getKeysWithValue(
    IStore _store,
    ResourceId _tableId,
    bytes32 valueHash
  ) internal view returns (bytes32[] memory keysWithValue) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    bytes memory _blob = _store.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /**
   * @notice Get keysWithValue.
   */
  function get(ResourceId _tableId, bytes32 valueHash) internal view returns (bytes32[] memory keysWithValue) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    bytes memory _blob = StoreSwitch.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /**
   * @notice Get keysWithValue.
   */
  function _get(ResourceId _tableId, bytes32 valueHash) internal view returns (bytes32[] memory keysWithValue) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    bytes memory _blob = StoreCore.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /**
   * @notice Get keysWithValue (using the specified store).
   */
  function get(
    IStore _store,
    ResourceId _tableId,
    bytes32 valueHash
  ) internal view returns (bytes32[] memory keysWithValue) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    bytes memory _blob = _store.getDynamicField(_tableId, _keyTuple, 0);
    return (SliceLib.getSubslice(_blob, 0, _blob.length).decodeArray_bytes32());
  }

  /**
   * @notice Set keysWithValue.
   */
  function setKeysWithValue(ResourceId _tableId, bytes32 valueHash, bytes32[] memory keysWithValue) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((keysWithValue)));
  }

  /**
   * @notice Set keysWithValue.
   */
  function _setKeysWithValue(ResourceId _tableId, bytes32 valueHash, bytes32[] memory keysWithValue) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    StoreCore.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((keysWithValue)));
  }

  /**
   * @notice Set keysWithValue (using the specified store).
   */
  function setKeysWithValue(
    IStore _store,
    ResourceId _tableId,
    bytes32 valueHash,
    bytes32[] memory keysWithValue
  ) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    _store.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((keysWithValue)));
  }

  /**
   * @notice Set keysWithValue.
   */
  function set(ResourceId _tableId, bytes32 valueHash, bytes32[] memory keysWithValue) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    StoreSwitch.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((keysWithValue)));
  }

  /**
   * @notice Set keysWithValue.
   */
  function _set(ResourceId _tableId, bytes32 valueHash, bytes32[] memory keysWithValue) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    StoreCore.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((keysWithValue)));
  }

  /**
   * @notice Set keysWithValue (using the specified store).
   */
  function set(IStore _store, ResourceId _tableId, bytes32 valueHash, bytes32[] memory keysWithValue) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    _store.setDynamicField(_tableId, _keyTuple, 0, EncodeArray.encode((keysWithValue)));
  }

  /**
   * @notice Get the length of keysWithValue.
   */
  function lengthKeysWithValue(ResourceId _tableId, bytes32 valueHash) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 32;
    }
  }

  /**
   * @notice Get the length of keysWithValue.
   */
  function _lengthKeysWithValue(ResourceId _tableId, bytes32 valueHash) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 32;
    }
  }

  /**
   * @notice Get the length of keysWithValue (using the specified store).
   */
  function lengthKeysWithValue(IStore _store, ResourceId _tableId, bytes32 valueHash) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    uint256 _byteLength = _store.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 32;
    }
  }

  /**
   * @notice Get the length of keysWithValue.
   */
  function length(ResourceId _tableId, bytes32 valueHash) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    uint256 _byteLength = StoreSwitch.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 32;
    }
  }

  /**
   * @notice Get the length of keysWithValue.
   */
  function _length(ResourceId _tableId, bytes32 valueHash) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    uint256 _byteLength = StoreCore.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 32;
    }
  }

  /**
   * @notice Get the length of keysWithValue (using the specified store).
   */
  function length(IStore _store, ResourceId _tableId, bytes32 valueHash) internal view returns (uint256) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    uint256 _byteLength = _store.getDynamicFieldLength(_tableId, _keyTuple, 0);
    unchecked {
      return _byteLength / 32;
    }
  }

  /**
   * @notice Get an item of keysWithValue.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemKeysWithValue(
    ResourceId _tableId,
    bytes32 valueHash,
    uint256 _index
  ) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 32, (_index + 1) * 32);
      return (bytes32(_blob));
    }
  }

  /**
   * @notice Get an item of keysWithValue.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItemKeysWithValue(
    ResourceId _tableId,
    bytes32 valueHash,
    uint256 _index
  ) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 32, (_index + 1) * 32);
      return (bytes32(_blob));
    }
  }

  /**
   * @notice Get an item of keysWithValue (using the specified store).
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItemKeysWithValue(
    IStore _store,
    ResourceId _tableId,
    bytes32 valueHash,
    uint256 _index
  ) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    unchecked {
      bytes memory _blob = _store.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 32, (_index + 1) * 32);
      return (bytes32(_blob));
    }
  }

  /**
   * @notice Get an item of keysWithValue.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItem(ResourceId _tableId, bytes32 valueHash, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    unchecked {
      bytes memory _blob = StoreSwitch.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 32, (_index + 1) * 32);
      return (bytes32(_blob));
    }
  }

  /**
   * @notice Get an item of keysWithValue.
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function _getItem(ResourceId _tableId, bytes32 valueHash, uint256 _index) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    unchecked {
      bytes memory _blob = StoreCore.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 32, (_index + 1) * 32);
      return (bytes32(_blob));
    }
  }

  /**
   * @notice Get an item of keysWithValue (using the specified store).
   * @dev Reverts with Store_IndexOutOfBounds if `_index` is out of bounds for the array.
   */
  function getItem(
    IStore _store,
    ResourceId _tableId,
    bytes32 valueHash,
    uint256 _index
  ) internal view returns (bytes32) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    unchecked {
      bytes memory _blob = _store.getDynamicFieldSlice(_tableId, _keyTuple, 0, _index * 32, (_index + 1) * 32);
      return (bytes32(_blob));
    }
  }

  /**
   * @notice Push an element to keysWithValue.
   */
  function pushKeysWithValue(ResourceId _tableId, bytes32 valueHash, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to keysWithValue.
   */
  function _pushKeysWithValue(ResourceId _tableId, bytes32 valueHash, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to keysWithValue (using the specified store).
   */
  function pushKeysWithValue(IStore _store, ResourceId _tableId, bytes32 valueHash, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    _store.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to keysWithValue.
   */
  function push(ResourceId _tableId, bytes32 valueHash, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    StoreSwitch.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to keysWithValue.
   */
  function _push(ResourceId _tableId, bytes32 valueHash, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    StoreCore.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Push an element to keysWithValue (using the specified store).
   */
  function push(IStore _store, ResourceId _tableId, bytes32 valueHash, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    _store.pushToDynamicField(_tableId, _keyTuple, 0, abi.encodePacked((_element)));
  }

  /**
   * @notice Pop an element from keysWithValue.
   */
  function popKeysWithValue(ResourceId _tableId, bytes32 valueHash) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 0, 32);
  }

  /**
   * @notice Pop an element from keysWithValue.
   */
  function _popKeysWithValue(ResourceId _tableId, bytes32 valueHash) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 0, 32);
  }

  /**
   * @notice Pop an element from keysWithValue (using the specified store).
   */
  function popKeysWithValue(IStore _store, ResourceId _tableId, bytes32 valueHash) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    _store.popFromDynamicField(_tableId, _keyTuple, 0, 32);
  }

  /**
   * @notice Pop an element from keysWithValue.
   */
  function pop(ResourceId _tableId, bytes32 valueHash) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    StoreSwitch.popFromDynamicField(_tableId, _keyTuple, 0, 32);
  }

  /**
   * @notice Pop an element from keysWithValue.
   */
  function _pop(ResourceId _tableId, bytes32 valueHash) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    StoreCore.popFromDynamicField(_tableId, _keyTuple, 0, 32);
  }

  /**
   * @notice Pop an element from keysWithValue (using the specified store).
   */
  function pop(IStore _store, ResourceId _tableId, bytes32 valueHash) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    _store.popFromDynamicField(_tableId, _keyTuple, 0, 32);
  }

  /**
   * @notice Update an element of keysWithValue at `_index`.
   */
  function updateKeysWithValue(ResourceId _tableId, bytes32 valueHash, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 32), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of keysWithValue at `_index`.
   */
  function _updateKeysWithValue(ResourceId _tableId, bytes32 valueHash, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 32), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of keysWithValue (using the specified store) at `_index`.
   */
  function updateKeysWithValue(
    IStore _store,
    ResourceId _tableId,
    bytes32 valueHash,
    uint256 _index,
    bytes32 _element
  ) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      _store.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 32), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of keysWithValue at `_index`.
   */
  function update(ResourceId _tableId, bytes32 valueHash, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreSwitch.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 32), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of keysWithValue at `_index`.
   */
  function _update(ResourceId _tableId, bytes32 valueHash, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      StoreCore.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 32), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Update an element of keysWithValue (using the specified store) at `_index`.
   */
  function update(IStore _store, ResourceId _tableId, bytes32 valueHash, uint256 _index, bytes32 _element) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    unchecked {
      bytes memory _encoded = abi.encodePacked((_element));
      _store.spliceDynamicData(_tableId, _keyTuple, 0, uint40(_index * 32), uint40(_encoded.length), _encoded);
    }
  }

  /**
   * @notice Delete all data for given keys.
   */
  function deleteRecord(ResourceId _tableId, bytes32 valueHash) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    StoreSwitch.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Delete all data for given keys.
   */
  function _deleteRecord(ResourceId _tableId, bytes32 valueHash) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    StoreCore.deleteRecord(_tableId, _keyTuple, _fieldLayout);
  }

  /**
   * @notice Delete all data for given keys (using the specified store).
   */
  function deleteRecord(IStore _store, ResourceId _tableId, bytes32 valueHash) internal {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    _store.deleteRecord(_tableId, _keyTuple);
  }

  /**
   * @notice Tightly pack dynamic data lengths using this table's schema.
   * @return _encodedLengths The lengths of the dynamic fields (packed into a single bytes32 value).
   */
  function encodeLengths(bytes32[] memory keysWithValue) internal pure returns (PackedCounter _encodedLengths) {
    // Lengths are effectively checked during copy by 2**40 bytes exceeding gas limits
    unchecked {
      _encodedLengths = PackedCounterLib.pack(keysWithValue.length * 32);
    }
  }

  /**
   * @notice Tightly pack dynamic (variable length) data using this table's schema.
   * @return The dynamic data, encoded into a sequence of bytes.
   */
  function encodeDynamic(bytes32[] memory keysWithValue) internal pure returns (bytes memory) {
    return abi.encodePacked(EncodeArray.encode((keysWithValue)));
  }

  /**
   * @notice Encode all of a record's fields.
   * @return The static (fixed length) data, encoded into a sequence of bytes.
   * @return The lengths of the dynamic fields (packed into a single bytes32 value).
   * @return The dynamic (variable length) data, encoded into a sequence of bytes.
   */
  function encode(bytes32[] memory keysWithValue) internal pure returns (bytes memory, PackedCounter, bytes memory) {
    bytes memory _staticData;
    PackedCounter _encodedLengths = encodeLengths(keysWithValue);
    bytes memory _dynamicData = encodeDynamic(keysWithValue);

    return (_staticData, _encodedLengths, _dynamicData);
  }

  /**
   * @notice Encode keys as a bytes32 array using this table's field layout.
   */
  function encodeKeyTuple(bytes32 valueHash) internal pure returns (bytes32[] memory) {
    bytes32[] memory _keyTuple = new bytes32[](1);
    _keyTuple[0] = valueHash;

    return _keyTuple;
  }
}
