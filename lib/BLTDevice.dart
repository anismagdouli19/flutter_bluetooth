part of flutter_bluetooth;

/// Bluetooth classic device

class BLTDevice extends BluetoothDevice {
  List<BLTService> _services;

  List<BLTService> get services => _services;

  BLTDevice({name, address,})
      : super(
          name: name,
          address: address,
          type: BluetoothType.CLASSIC,
        );

  Future<List<BLTService>> fetchServicesFromCache() async {}

  Future<List<BLTService>> fetchServicesWithSdp() async {}
}

/// Bluetooth classic service

class BLTService {
  BLTDevice _device;

  BLTDevice get device => _device;

  String _uuid;

  String get uuid => _uuid;

  String _profile;

  String get profile => _profile;

  BLTService({device, uuid}) {
    _device = device;
    _uuid = uuid;
  }


  Future<BLTService> connect() async {
    return this;
  }

  Future<BLTService> disconnect() async {
    return this;
  }

  void read() {}
  void write() {}
}
