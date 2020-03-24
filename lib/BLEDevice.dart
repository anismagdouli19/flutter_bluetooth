part of flutter_bluetooth;

/// Bluetooth low energy device

class BLEDevice extends BluetoothDevice {
  List<BLEService> _services;

  List<BLEService> get services => _services;

  BluetoothConnectionState _connectionState;

  BluetoothConnectionState get connectionState => _connectionState;

  BLEDevice({name, address})
      : super(
          name: name,
          address: address,
          type: BluetoothType.LE,
        );

  Future<BLEDevice> connect() async {
    return this;
  }

  Future<BLEDevice> disconnect() async {
    return this;
  }

  Future<List<BLEService>> fetchServices() async {}
}

/// Bluetooth low energy service

class BLEService {
  BLTDevice _device;

  BLTDevice get device => _device;

  String _uuid;

  String get uuid => _uuid;

  String _profile;

  String get profile => _profile;

  List<BLECharacteristic> _characteristics;

  List<BLECharacteristic> get characteristics => _characteristics;

  BLEService({device, uuid})
      : _device = device,
        _uuid = uuid;

  Future<BLECharacteristic> fetchCharacteristics() async {}
}

/// Bluetooth low energy characteristic

class BLECharacteristic {
  String _uuid;

  String get uuid => _uuid;


  void read() {}
  void write() {}
}
