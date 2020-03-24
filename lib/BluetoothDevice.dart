part of flutter_bluetooth;

/// Check if when connection state change fires on Android, there is an extra for the service
/// in BLT, should the connection state listener be on the device level or the service level ?
///
/// How should we transfer the stream from BluetoothAdapter to BlueToothDevice?

enum BluetoothType { CLASSIC, LE, DUAL, UNKNOWN }
enum BluetoothBondState { BONDED, BONDING, NONE }
enum BluetoothConnectionState { CONNECTED, CONNECTING, DISCONNECTED, DISCONNECTING }

abstract class BluetoothDevice with BondStateHandler, ConnectionStateHandler{
  String _name;

  String get name => _name;

  String _address;

  String get address => _address;

  BluetoothType _type;

  BluetoothType get type => _type;

  bool isType(BluetoothType type) => _type == type;

  Function([BLTDevice]) onPairingRequestReceived;

  /// Handle pairing request
  /// Handle device name change, ACTION_NAME_CHANGED? ACTION_ALIAS_CHANGED?
  /// Deal with class and handle device class change, ACTION_CLASS_CHANGED?

  BluetoothDevice({
    @required String name,
    @required String address,
    @required BluetoothType type,
    bool listeners = true,
  }) {
    _name = name;
    _address = address;
    _type = type;
    if (listeners) listenForStateChanges();
  }

  factory BluetoothDevice.fromProto(
    proto.BluetoothDevice device, {
    bool listeners = true,
  }) {
    String name = device.name;
    String address = device.address;
    BluetoothDevice_Type type = device.type;

    Map<proto.BluetoothDevice_Type, Function> typeMap = {
      BluetoothDevice_Type.CLASSIC: () => BLTDevice(name: name, address: address),
      BluetoothDevice_Type.LE: () => BLEDevice(name: name, address: address),
      BluetoothDevice_Type.DUAL: () => DualDevice(name: name, address: address),
      BluetoothDevice_Type.UNKNOWN: () => UnknownDevice(name: name, address: address),
    };
    return typeMap[type]();
  }

  listenForStateChanges() {
    listenForBondStateChanges();
    listenForConnectionStateChanges();
  }

  stopListeningForStateChanges() {
    stopListeningForBondStateChanges();
    stopListeningForConnectionStateChanges();
  }
}

mixin BondStateHandler {

  BluetoothBondState _bondState;

  BluetoothBondState get bondState => _bondState;

  StreamSubscription _bondStateSubscription;

  bool isBondState(BluetoothBondState bondState) => _bondState == bondState;

  Function(BluetoothDevice) onBonding;
  Function(BluetoothDevice) onBonded;
  Function(BluetoothDevice) onDetached;

  listenForBondStateChanges() {
    Map<proto.BondStateMessage_BondState, Function> callbackMap = {
      BondStateMessage_BondState.BONDING: () => onBonding,
      BondStateMessage_BondState.BONDED: () => onBonded,
      BondStateMessage_BondState.NONE: () => onDetached,
    };
    _bondStateSubscription = BluetoothAdapter.instance.bondStateChannelStream.listen((buffer) {
      proto.BondStateMessage bondStateMessage = BondStateMessage.fromBuffer(buffer);
      callbackMap[bondStateMessage.state]()();
    });
  }

  stopListeningForBondStateChanges() {
    _bondStateSubscription.cancel();
  }
}

mixin ConnectionStateHandler {

  BluetoothConnectionState _connectionState;

  BluetoothConnectionState get connectionState => _connectionState;

  StreamSubscription _connectionStateSubscription;

  bool isConnectionState(BluetoothConnectionState connectionState) => _connectionState == connectionState;

  Function(BluetoothDevice) onConnecting;
  Function(BluetoothDevice) onConnected;
  Function(BluetoothDevice) onDisconnecting;
  Function(BluetoothDevice) onDisconnected;

  listenForConnectionStateChanges() {
    Map<proto.ConnectionStateMessage_ConnectionState, Function> callbackMap = {
      ConnectionStateMessage_ConnectionState.CONNECTING: () => onConnecting,
      ConnectionStateMessage_ConnectionState.CONNECTED: () => onConnected,
      ConnectionStateMessage_ConnectionState.DISCONNECTING: () => onDisconnecting,
      ConnectionStateMessage_ConnectionState.DISCONNECTED: () => onDisconnected,
    };
    _connectionStateSubscription = BluetoothAdapter.instance.connectionStateChannelStream.listen((buffer) {
      proto.ConnectionStateMessage connectionStateMessage = ConnectionStateMessage.fromBuffer(buffer);
      callbackMap[connectionStateMessage.state]()();
    });
  }

  stopListeningForConnectionStateChanges() {
    _connectionStateSubscription.cancel();
  }
}
