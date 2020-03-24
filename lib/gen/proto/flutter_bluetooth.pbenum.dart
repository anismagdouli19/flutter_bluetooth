///
//  Generated code. Do not modify.
//  source: proto/flutter_bluetooth.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

// ignore_for_file: UNDEFINED_SHOWN_NAME,UNUSED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class AdapterStateMessage_AdapterState extends $pb.ProtobufEnum {
  static const AdapterStateMessage_AdapterState TURNING_ON = AdapterStateMessage_AdapterState._(0, 'TURNING_ON');
  static const AdapterStateMessage_AdapterState TURNED_ON = AdapterStateMessage_AdapterState._(1, 'TURNED_ON');
  static const AdapterStateMessage_AdapterState TURNING_OFF = AdapterStateMessage_AdapterState._(2, 'TURNING_OFF');
  static const AdapterStateMessage_AdapterState TURNED_OFF = AdapterStateMessage_AdapterState._(3, 'TURNED_OFF');

  static const $core.List<AdapterStateMessage_AdapterState> values = <AdapterStateMessage_AdapterState> [
    TURNING_ON,
    TURNED_ON,
    TURNING_OFF,
    TURNED_OFF,
  ];

  static final $core.Map<$core.int, AdapterStateMessage_AdapterState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AdapterStateMessage_AdapterState valueOf($core.int value) => _byValue[value];

  const AdapterStateMessage_AdapterState._($core.int v, $core.String n) : super(v, n);
}

class DiscoveryMessage_DiscoveryAction extends $pb.ProtobufEnum {
  static const DiscoveryMessage_DiscoveryAction START = DiscoveryMessage_DiscoveryAction._(0, 'START');
  static const DiscoveryMessage_DiscoveryAction FOUND = DiscoveryMessage_DiscoveryAction._(1, 'FOUND');
  static const DiscoveryMessage_DiscoveryAction COMPLETE = DiscoveryMessage_DiscoveryAction._(2, 'COMPLETE');
  static const DiscoveryMessage_DiscoveryAction CANCLED = DiscoveryMessage_DiscoveryAction._(3, 'CANCLED');

  static const $core.List<DiscoveryMessage_DiscoveryAction> values = <DiscoveryMessage_DiscoveryAction> [
    START,
    FOUND,
    COMPLETE,
    CANCLED,
  ];

  static final $core.Map<$core.int, DiscoveryMessage_DiscoveryAction> _byValue = $pb.ProtobufEnum.initByValue(values);
  static DiscoveryMessage_DiscoveryAction valueOf($core.int value) => _byValue[value];

  const DiscoveryMessage_DiscoveryAction._($core.int v, $core.String n) : super(v, n);
}

class BondStateMessage_BondState extends $pb.ProtobufEnum {
  static const BondStateMessage_BondState BONDING = BondStateMessage_BondState._(0, 'BONDING');
  static const BondStateMessage_BondState BONDED = BondStateMessage_BondState._(1, 'BONDED');
  static const BondStateMessage_BondState NONE = BondStateMessage_BondState._(2, 'NONE');

  static const $core.List<BondStateMessage_BondState> values = <BondStateMessage_BondState> [
    BONDING,
    BONDED,
    NONE,
  ];

  static final $core.Map<$core.int, BondStateMessage_BondState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BondStateMessage_BondState valueOf($core.int value) => _byValue[value];

  const BondStateMessage_BondState._($core.int v, $core.String n) : super(v, n);
}

class ConnectionStateMessage_ConnectionState extends $pb.ProtobufEnum {
  static const ConnectionStateMessage_ConnectionState CONNECTING = ConnectionStateMessage_ConnectionState._(0, 'CONNECTING');
  static const ConnectionStateMessage_ConnectionState CONNECTED = ConnectionStateMessage_ConnectionState._(1, 'CONNECTED');
  static const ConnectionStateMessage_ConnectionState DISCONNECTING = ConnectionStateMessage_ConnectionState._(2, 'DISCONNECTING');
  static const ConnectionStateMessage_ConnectionState DISCONNECTED = ConnectionStateMessage_ConnectionState._(3, 'DISCONNECTED');

  static const $core.List<ConnectionStateMessage_ConnectionState> values = <ConnectionStateMessage_ConnectionState> [
    CONNECTING,
    CONNECTED,
    DISCONNECTING,
    DISCONNECTED,
  ];

  static final $core.Map<$core.int, ConnectionStateMessage_ConnectionState> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ConnectionStateMessage_ConnectionState valueOf($core.int value) => _byValue[value];

  const ConnectionStateMessage_ConnectionState._($core.int v, $core.String n) : super(v, n);
}

class BluetoothDevice_Type extends $pb.ProtobufEnum {
  static const BluetoothDevice_Type CLASSIC = BluetoothDevice_Type._(0, 'CLASSIC');
  static const BluetoothDevice_Type LE = BluetoothDevice_Type._(1, 'LE');
  static const BluetoothDevice_Type DUAL = BluetoothDevice_Type._(2, 'DUAL');
  static const BluetoothDevice_Type UNKNOWN = BluetoothDevice_Type._(3, 'UNKNOWN');

  static const $core.List<BluetoothDevice_Type> values = <BluetoothDevice_Type> [
    CLASSIC,
    LE,
    DUAL,
    UNKNOWN,
  ];

  static final $core.Map<$core.int, BluetoothDevice_Type> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BluetoothDevice_Type valueOf($core.int value) => _byValue[value];

  const BluetoothDevice_Type._($core.int v, $core.String n) : super(v, n);
}

