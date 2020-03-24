part of flutter_bluetooth;

class UnknownDevice extends BluetoothDevice {

  UnknownDevice({name, address})
      : super(
    name: name,
    address: address,
    type: BluetoothType.UNKNOWN,
  );

  getAsBLT() => BLTDevice(name: _name, address: _address);
  getAsBLE() => BLEDevice(name: _name, address: _address);
  getAsDual() => DualDevice(name: _name, address: _address);
}