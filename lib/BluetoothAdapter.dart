part of flutter_bluetooth;

enum BluetoothAdapterState { TURNING_ON, TURNED_ON, TURNING_OFF, TURNED_OFF }

class BluetoothAdapter with AdapterStateHandler, DiscoveryHandler {
  /// I hate that the streams aren't private just so a BluetoothDevice can subscribe to it

  static final EventChannel _bondStateChannel = EventChannel('$NAMESPACE/bondState');
  Stream bondStateChannelStream = _bondStateChannel.receiveBroadcastStream();

  static final EventChannel _connectionStateChannel = EventChannel('$NAMESPACE/connectionState');
  Stream connectionStateChannelStream = _connectionStateChannel.receiveBroadcastStream();

  static final MethodChannel _methodChannel = MethodChannel('$NAMESPACE/methods');

  static final BluetoothAdapter _instance = BluetoothAdapter._();

  static BluetoothAdapter get instance => _instance;

  BluetoothAdapter._() {
    initAdapterStateHandler(isEnabled);
    initDiscoveryHandler(isDiscovering);
  }

  /// Prefer that method names should be kept in enums and processed with protobuffer

  Future<dynamic> invokeMethod(String method) async {
    try {
      return await _methodChannel.invokeMethod(method);
    } on PlatformException catch (e) {
      print('code: ${e.code}');
      print('message: ${e.message}');
      print('details: ${e.details}');
    }
  }

  Future<bool> isAvailable() async {
    return await invokeMethod('isAvailable');
  }

  Future<bool> isEnabled() async {
    return await invokeMethod('isEnabled');
  }

  Future<void> enable() async {
    await invokeMethod('enable');
  }

  Future<void> enableWithPermission() async {
    await invokeMethod('enableWithPermission');
  }

  Future<void> disable() async {
    await invokeMethod('disable');
  }

  Future<List<BluetoothDevice>> getPairedDevices() async {}

  Future<bool> isDiscovering() async {
    return await invokeMethod('isDiscovering');
  }

  StreamSubscription startDiscovery(Function(BluetoothDevice) onDiscovered) {}

  stopDiscovery() {}
}

mixin AdapterStateHandler {
  static final EventChannel _adapterStateChannel = EventChannel('$NAMESPACE/adapterState');
  Stream _adapterStateChannelStream = _adapterStateChannel.receiveBroadcastStream();
  StreamSubscription _adapterStateSubscription;

  BluetoothAdapterState _adapterState;

  BluetoothAdapterState get adapterState => _adapterState;

  bool isAdapterState(BluetoothAdapterState state) => _adapterState == state;

  Function onTurningOn;
  Function onTurnedOn;
  Function onTurningOff;
  Function onTurnedOff;

  initAdapterStateHandler(Function isEnabled) async {
    _adapterState = await isEnabled() ? BluetoothAdapterState.TURNED_ON : BluetoothAdapterState.TURNED_OFF;

    Map<proto.AdapterStateMessage_AdapterState, Function> callbackMap = {
      AdapterStateMessage_AdapterState.TURNING_ON: () {
        _adapterState = BluetoothAdapterState.TURNING_ON;
        onTurningOn();
      },
      AdapterStateMessage_AdapterState.TURNED_ON: () {
        _adapterState = BluetoothAdapterState.TURNED_ON;
        onTurnedOn();
      },
      AdapterStateMessage_AdapterState.TURNING_OFF: () {
        _adapterState = BluetoothAdapterState.TURNING_OFF;
        onTurningOff();
      },
      AdapterStateMessage_AdapterState.TURNED_OFF: () {
        _adapterState = BluetoothAdapterState.TURNED_OFF;
        onTurnedOff();
      },
    };
    _adapterStateSubscription = _adapterStateChannelStream.listen((buffer) {
      proto.AdapterStateMessage adapterStateMessage = AdapterStateMessage.fromBuffer(buffer);
      callbackMap[adapterStateMessage.state]();
    });
  }
}

/// Discovery isDiscovering property could be problematic if we implement dynamic discovery duration
mixin DiscoveryHandler {
  static final EventChannel _discoveryChannel = EventChannel('$NAMESPACE/discovery');
  Stream _discoveryChannelStream = _discoveryChannel.receiveBroadcastStream();
  StreamSubscription _discoverySubscription;

  bool _discoveryState;
  bool get discoveryState => _discoveryState;

  Function onDiscoveryStart;
  Function(BluetoothDevice) onDeviceDiscovered;
  Function onDiscoveryCompleted;
  Function onDiscoveryCanceled;
  Function onDiscoveryStopped;

  initDiscoveryHandler(Function isDiscovering) async {
    _discoveryState = await isDiscovering();

    Map<proto.DiscoveryMessage_DiscoveryAction, Function> callbackMap = {
      DiscoveryMessage_DiscoveryAction.START: () {
        _discoveryState = true;
        onDiscoveryStart();
      },
      DiscoveryMessage_DiscoveryAction.FOUND: (d) {
        onDeviceDiscovered(d);
      },
      DiscoveryMessage_DiscoveryAction.COMPLETE: () {
        _discoveryState = false;
        onDiscoveryCompleted();
        onDiscoveryStopped();
      },
      DiscoveryMessage_DiscoveryAction.CANCLED: () {
        _discoveryState = false;
        onDiscoveryCanceled();
        onDiscoveryStopped();
      },
    };
    _discoverySubscription = _discoveryChannelStream.listen((buffer) {
      proto.DiscoveryMessage discoveryMessage = DiscoveryMessage.fromBuffer(buffer);
      proto.DiscoveryMessage_DiscoveryAction action = discoveryMessage.action;
      if (action == DiscoveryMessage_DiscoveryAction.FOUND) {
        proto.BluetoothDevice device = discoveryMessage.result.device;
        callbackMap[action](BluetoothDevice.fromProto(device));
      } else
        callbackMap[action]();
    });
  }
}

mixin ErrorCallbacks {
  Function onErrorAdapterNotAvailable;
  Function onErrorAdapterIsOff;
  Function onErrorAdapterIsOn;

  Map<String, Function> errorMap;

  initErrorCallbacks() {
    errorMap = {'ADAPTER_NOT_AVAILABLE': onErrorAdapterNotAvailable, 'ADAPTER_IS_OFF': onErrorAdapterIsOff, 'ADAPTER_IS_ON': onErrorAdapterIsOn};
  }

  ron() {
    print('ErrorCallbacks');
  }
}

//class BluetoothBondChange {
//  BluetoothDevice device;
//  BluetoothBondState bondState;
//}
//
//class BluetoothConnectionChange {
//  BluetoothDevice device;
//  BluetoothConnectionState connectionState;
//}
