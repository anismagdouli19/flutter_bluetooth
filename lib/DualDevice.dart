part of flutter_bluetooth;

/// Transfer pairing request or any other future base BluetoothDevice property from Dual to BLT / BLE
/// Double code for getAs... in Dual and Unknown

class DualDevice extends BluetoothDevice {
  BLTDevice _bltDevice;

  BLTDevice get bltDevice => _bltDevice;

  BLEDevice _bleDevice;

  BLEDevice get bleDevice => _bleDevice;

  DualDevice({name, address})
      : _bltDevice = BLTDevice(
    name: name,
    address: address,
  ),
        _bleDevice = BLEDevice(
          name: name,
          address: address,
        ),
        super(
        name: name,
        address: address,
        type: BluetoothType.DUAL,
      );

  void setBondState(BluetoothBondState bondState) {
    _bondState = bondState;
//    _bltDevice.setBondState(bondState);
//    _bleDevice.setBondState(bondState);
  }

  getAsBLT() => BLTDevice(name: _name, address: _address);
  getAsBLE() => BLEDevice(name: _name, address: _address);
}
