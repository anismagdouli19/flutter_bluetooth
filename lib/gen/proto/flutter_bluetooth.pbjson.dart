///
//  Generated code. Do not modify.
//  source: proto/flutter_bluetooth.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

const AdapterStateMessage$json = const {
  '1': 'AdapterStateMessage',
  '2': const [
    const {'1': 'state', '3': 1, '4': 1, '5': 14, '6': '.flutter_bluetooth.AdapterStateMessage.AdapterState', '10': 'state'},
  ],
  '4': const [AdapterStateMessage_AdapterState$json],
};

const AdapterStateMessage_AdapterState$json = const {
  '1': 'AdapterState',
  '2': const [
    const {'1': 'TURNING_ON', '2': 0},
    const {'1': 'TURNED_ON', '2': 1},
    const {'1': 'TURNING_OFF', '2': 2},
    const {'1': 'TURNED_OFF', '2': 3},
  ],
};

const DiscoveryMessage$json = const {
  '1': 'DiscoveryMessage',
  '2': const [
    const {'1': 'action', '3': 1, '4': 1, '5': 14, '6': '.flutter_bluetooth.DiscoveryMessage.DiscoveryAction', '10': 'action'},
    const {'1': 'result', '3': 2, '4': 1, '5': 11, '6': '.flutter_bluetooth.DiscoveryResult', '10': 'result'},
  ],
  '4': const [DiscoveryMessage_DiscoveryAction$json],
};

const DiscoveryMessage_DiscoveryAction$json = const {
  '1': 'DiscoveryAction',
  '2': const [
    const {'1': 'START', '2': 0},
    const {'1': 'FOUND', '2': 1},
    const {'1': 'COMPLETE', '2': 2},
    const {'1': 'CANCLED', '2': 3},
  ],
};

const DiscoveryResult$json = const {
  '1': 'DiscoveryResult',
  '2': const [
    const {'1': 'device', '3': 1, '4': 1, '5': 11, '6': '.flutter_bluetooth.BluetoothDevice', '10': 'device'},
    const {'1': 'rssi', '3': 2, '4': 1, '5': 5, '10': 'rssi'},
  ],
};

const BondStateMessage$json = const {
  '1': 'BondStateMessage',
  '2': const [
    const {'1': 'device', '3': 1, '4': 1, '5': 11, '6': '.flutter_bluetooth.BluetoothDevice', '10': 'device'},
    const {'1': 'state', '3': 2, '4': 1, '5': 14, '6': '.flutter_bluetooth.BondStateMessage.BondState', '10': 'state'},
  ],
  '4': const [BondStateMessage_BondState$json],
};

const BondStateMessage_BondState$json = const {
  '1': 'BondState',
  '2': const [
    const {'1': 'BONDING', '2': 0},
    const {'1': 'BONDED', '2': 1},
    const {'1': 'NONE', '2': 2},
  ],
};

const ConnectionStateMessage$json = const {
  '1': 'ConnectionStateMessage',
  '2': const [
    const {'1': 'device', '3': 1, '4': 1, '5': 11, '6': '.flutter_bluetooth.BluetoothDevice', '10': 'device'},
    const {'1': 'state', '3': 2, '4': 1, '5': 14, '6': '.flutter_bluetooth.ConnectionStateMessage.ConnectionState', '10': 'state'},
  ],
  '4': const [ConnectionStateMessage_ConnectionState$json],
};

const ConnectionStateMessage_ConnectionState$json = const {
  '1': 'ConnectionState',
  '2': const [
    const {'1': 'CONNECTING', '2': 0},
    const {'1': 'CONNECTED', '2': 1},
    const {'1': 'DISCONNECTING', '2': 2},
    const {'1': 'DISCONNECTED', '2': 3},
  ],
};

const BluetoothDevice$json = const {
  '1': 'BluetoothDevice',
  '2': const [
    const {'1': 'address', '3': 1, '4': 1, '5': 9, '10': 'address'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'type', '3': 3, '4': 1, '5': 14, '6': '.flutter_bluetooth.BluetoothDevice.Type', '10': 'type'},
  ],
  '4': const [BluetoothDevice_Type$json],
};

const BluetoothDevice_Type$json = const {
  '1': 'Type',
  '2': const [
    const {'1': 'CLASSIC', '2': 0},
    const {'1': 'LE', '2': 1},
    const {'1': 'DUAL', '2': 2},
    const {'1': 'UNKNOWN', '2': 3},
  ],
};

