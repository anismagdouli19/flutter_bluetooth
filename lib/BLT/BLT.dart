import 'dart:async';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'dart:typed_data';

class BLT {
  static FlutterBluetoothSerial flutterBlueToothSerial = FlutterBluetoothSerial.instance;

  static Future<bool> adapterExists() async {
    return await flutterBlueToothSerial.isAvailable;
  }

  static void turnOnAdapter() {
    flutterBlueToothSerial.requestEnable();
  }

  static void turnOffAdapter() {
    flutterBlueToothSerial.requestDisable();
  }

  static Future<List<BluetoothDevice>> getPairedDevices() async {
    List<BluetoothDevice> pairedDevices = await flutterBlueToothSerial.getBondedDevices();
    return pairedDevices.where((device) => device.type.underlyingValue != 2).toList();
  }

  static StreamSubscription startDiscovery(Function(BluetoothDevice) onDiscovered) {
    return flutterBlueToothSerial.startDiscovery().listen((BluetoothDiscoveryResult result) {
      if (result.device.type.underlyingValue != 2)
        onDiscovered(result.device);
    });
  }

  static stopDiscovery() {
    flutterBlueToothSerial.cancelDiscovery();
  }

  static Future<List<dynamic>> fetchUuidsWithSdp(String address) async {
    return await FlutterBluetoothSerial.instance.fetchUuidsWithSdp(address);
  }

  static Future<List<dynamic>> getUuidsFromCache(String address) async {
    return await FlutterBluetoothSerial.instance.getUuidsFromCache(address);
  }

  static Future<BluetoothConnection> connect(BluetoothDevice device, String uuid) async {
    BluetoothConnection connection = await flutterBlueToothSerial.connectToSocket(device.address, uuid).timeout(
        Duration(seconds: 10)
    );
    print('From BLT: $connection');
    return connection;
  }

  static StreamSubscription watchDevice(BluetoothDevice device, {
    Function(BluetoothDevice) onConnecting,
    Function(BluetoothDevice) onConnected,
    Function(BluetoothDevice) onDisconnecting,
    Function(BluetoothDevice) onDisconnected
  }) {
    return flutterBlueToothSerial.watchDevice(device, onConnecting, onConnected, onDisconnecting, onDisconnected);
  }

  static disconnect(BluetoothConnection connection) {
    if (connection != null)
      connection.close();
  }

  static void read({@required BluetoothConnection connection, String streamName = 'defaultStream', @required Function onData, bool asString = false}) {
    StreamMaster streamMaster = connection.doesStreamExist(name: streamName) ? connection.getExistingStreamMaster(name: streamName) : connection.newStreamMaster(name: streamName);

    streamMaster.stream.listen((Uint8List data) {
      var _data = asString ? String.fromCharCodes(data) : data;
      onData(_data);
    });
    // Allow to close streams somehow
  }

  static void write({@required BluetoothConnection connection, @required String data}) {
    Uint8List bytes = Uint8List.fromList(data.codeUnits);
    connection.output.add(bytes);
  }
}
