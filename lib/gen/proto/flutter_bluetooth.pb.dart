///
//  Generated code. Do not modify.
//  source: proto/flutter_bluetooth.proto
//
// @dart = 2.3
// ignore_for_file: camel_case_types,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'flutter_bluetooth.pbenum.dart';

export 'flutter_bluetooth.pbenum.dart';

class AdapterStateMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('AdapterStateMessage', package: const $pb.PackageName('flutter_bluetooth'), createEmptyInstance: create)
    ..e<AdapterStateMessage_AdapterState>(1, 'state', $pb.PbFieldType.OE, defaultOrMaker: AdapterStateMessage_AdapterState.TURNING_ON, valueOf: AdapterStateMessage_AdapterState.valueOf, enumValues: AdapterStateMessage_AdapterState.values)
    ..hasRequiredFields = false
  ;

  AdapterStateMessage._() : super();
  factory AdapterStateMessage() => create();
  factory AdapterStateMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AdapterStateMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  AdapterStateMessage clone() => AdapterStateMessage()..mergeFromMessage(this);
  AdapterStateMessage copyWith(void Function(AdapterStateMessage) updates) => super.copyWith((message) => updates(message as AdapterStateMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static AdapterStateMessage create() => AdapterStateMessage._();
  AdapterStateMessage createEmptyInstance() => create();
  static $pb.PbList<AdapterStateMessage> createRepeated() => $pb.PbList<AdapterStateMessage>();
  @$core.pragma('dart2js:noInline')
  static AdapterStateMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AdapterStateMessage>(create);
  static AdapterStateMessage _defaultInstance;

  @$pb.TagNumber(1)
  AdapterStateMessage_AdapterState get state => $_getN(0);
  @$pb.TagNumber(1)
  set state(AdapterStateMessage_AdapterState v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasState() => $_has(0);
  @$pb.TagNumber(1)
  void clearState() => clearField(1);
}

class DiscoveryMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DiscoveryMessage', package: const $pb.PackageName('flutter_bluetooth'), createEmptyInstance: create)
    ..e<DiscoveryMessage_DiscoveryAction>(1, 'action', $pb.PbFieldType.OE, defaultOrMaker: DiscoveryMessage_DiscoveryAction.START, valueOf: DiscoveryMessage_DiscoveryAction.valueOf, enumValues: DiscoveryMessage_DiscoveryAction.values)
    ..aOM<DiscoveryResult>(2, 'result', subBuilder: DiscoveryResult.create)
    ..hasRequiredFields = false
  ;

  DiscoveryMessage._() : super();
  factory DiscoveryMessage() => create();
  factory DiscoveryMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DiscoveryMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DiscoveryMessage clone() => DiscoveryMessage()..mergeFromMessage(this);
  DiscoveryMessage copyWith(void Function(DiscoveryMessage) updates) => super.copyWith((message) => updates(message as DiscoveryMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DiscoveryMessage create() => DiscoveryMessage._();
  DiscoveryMessage createEmptyInstance() => create();
  static $pb.PbList<DiscoveryMessage> createRepeated() => $pb.PbList<DiscoveryMessage>();
  @$core.pragma('dart2js:noInline')
  static DiscoveryMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DiscoveryMessage>(create);
  static DiscoveryMessage _defaultInstance;

  @$pb.TagNumber(1)
  DiscoveryMessage_DiscoveryAction get action => $_getN(0);
  @$pb.TagNumber(1)
  set action(DiscoveryMessage_DiscoveryAction v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAction() => $_has(0);
  @$pb.TagNumber(1)
  void clearAction() => clearField(1);

  @$pb.TagNumber(2)
  DiscoveryResult get result => $_getN(1);
  @$pb.TagNumber(2)
  set result(DiscoveryResult v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasResult() => $_has(1);
  @$pb.TagNumber(2)
  void clearResult() => clearField(2);
  @$pb.TagNumber(2)
  DiscoveryResult ensureResult() => $_ensure(1);
}

class DiscoveryResult extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('DiscoveryResult', package: const $pb.PackageName('flutter_bluetooth'), createEmptyInstance: create)
    ..aOM<BluetoothDevice>(1, 'device', subBuilder: BluetoothDevice.create)
    ..a<$core.int>(2, 'rssi', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  DiscoveryResult._() : super();
  factory DiscoveryResult() => create();
  factory DiscoveryResult.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DiscoveryResult.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  DiscoveryResult clone() => DiscoveryResult()..mergeFromMessage(this);
  DiscoveryResult copyWith(void Function(DiscoveryResult) updates) => super.copyWith((message) => updates(message as DiscoveryResult));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static DiscoveryResult create() => DiscoveryResult._();
  DiscoveryResult createEmptyInstance() => create();
  static $pb.PbList<DiscoveryResult> createRepeated() => $pb.PbList<DiscoveryResult>();
  @$core.pragma('dart2js:noInline')
  static DiscoveryResult getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DiscoveryResult>(create);
  static DiscoveryResult _defaultInstance;

  @$pb.TagNumber(1)
  BluetoothDevice get device => $_getN(0);
  @$pb.TagNumber(1)
  set device(BluetoothDevice v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDevice() => $_has(0);
  @$pb.TagNumber(1)
  void clearDevice() => clearField(1);
  @$pb.TagNumber(1)
  BluetoothDevice ensureDevice() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.int get rssi => $_getIZ(1);
  @$pb.TagNumber(2)
  set rssi($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasRssi() => $_has(1);
  @$pb.TagNumber(2)
  void clearRssi() => clearField(2);
}

class BondStateMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BondStateMessage', package: const $pb.PackageName('flutter_bluetooth'), createEmptyInstance: create)
    ..aOM<BluetoothDevice>(1, 'device', subBuilder: BluetoothDevice.create)
    ..e<BondStateMessage_BondState>(2, 'state', $pb.PbFieldType.OE, defaultOrMaker: BondStateMessage_BondState.BONDING, valueOf: BondStateMessage_BondState.valueOf, enumValues: BondStateMessage_BondState.values)
    ..hasRequiredFields = false
  ;

  BondStateMessage._() : super();
  factory BondStateMessage() => create();
  factory BondStateMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BondStateMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BondStateMessage clone() => BondStateMessage()..mergeFromMessage(this);
  BondStateMessage copyWith(void Function(BondStateMessage) updates) => super.copyWith((message) => updates(message as BondStateMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BondStateMessage create() => BondStateMessage._();
  BondStateMessage createEmptyInstance() => create();
  static $pb.PbList<BondStateMessage> createRepeated() => $pb.PbList<BondStateMessage>();
  @$core.pragma('dart2js:noInline')
  static BondStateMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BondStateMessage>(create);
  static BondStateMessage _defaultInstance;

  @$pb.TagNumber(1)
  BluetoothDevice get device => $_getN(0);
  @$pb.TagNumber(1)
  set device(BluetoothDevice v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDevice() => $_has(0);
  @$pb.TagNumber(1)
  void clearDevice() => clearField(1);
  @$pb.TagNumber(1)
  BluetoothDevice ensureDevice() => $_ensure(0);

  @$pb.TagNumber(2)
  BondStateMessage_BondState get state => $_getN(1);
  @$pb.TagNumber(2)
  set state(BondStateMessage_BondState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);
}

class ConnectionStateMessage extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('ConnectionStateMessage', package: const $pb.PackageName('flutter_bluetooth'), createEmptyInstance: create)
    ..aOM<BluetoothDevice>(1, 'device', subBuilder: BluetoothDevice.create)
    ..e<ConnectionStateMessage_ConnectionState>(2, 'state', $pb.PbFieldType.OE, defaultOrMaker: ConnectionStateMessage_ConnectionState.CONNECTING, valueOf: ConnectionStateMessage_ConnectionState.valueOf, enumValues: ConnectionStateMessage_ConnectionState.values)
    ..hasRequiredFields = false
  ;

  ConnectionStateMessage._() : super();
  factory ConnectionStateMessage() => create();
  factory ConnectionStateMessage.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConnectionStateMessage.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  ConnectionStateMessage clone() => ConnectionStateMessage()..mergeFromMessage(this);
  ConnectionStateMessage copyWith(void Function(ConnectionStateMessage) updates) => super.copyWith((message) => updates(message as ConnectionStateMessage));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static ConnectionStateMessage create() => ConnectionStateMessage._();
  ConnectionStateMessage createEmptyInstance() => create();
  static $pb.PbList<ConnectionStateMessage> createRepeated() => $pb.PbList<ConnectionStateMessage>();
  @$core.pragma('dart2js:noInline')
  static ConnectionStateMessage getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConnectionStateMessage>(create);
  static ConnectionStateMessage _defaultInstance;

  @$pb.TagNumber(1)
  BluetoothDevice get device => $_getN(0);
  @$pb.TagNumber(1)
  set device(BluetoothDevice v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasDevice() => $_has(0);
  @$pb.TagNumber(1)
  void clearDevice() => clearField(1);
  @$pb.TagNumber(1)
  BluetoothDevice ensureDevice() => $_ensure(0);

  @$pb.TagNumber(2)
  ConnectionStateMessage_ConnectionState get state => $_getN(1);
  @$pb.TagNumber(2)
  set state(ConnectionStateMessage_ConnectionState v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);
}

class BluetoothDevice extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo('BluetoothDevice', package: const $pb.PackageName('flutter_bluetooth'), createEmptyInstance: create)
    ..aOS(1, 'address')
    ..aOS(2, 'name')
    ..e<BluetoothDevice_Type>(3, 'type', $pb.PbFieldType.OE, defaultOrMaker: BluetoothDevice_Type.CLASSIC, valueOf: BluetoothDevice_Type.valueOf, enumValues: BluetoothDevice_Type.values)
    ..hasRequiredFields = false
  ;

  BluetoothDevice._() : super();
  factory BluetoothDevice() => create();
  factory BluetoothDevice.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BluetoothDevice.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  BluetoothDevice clone() => BluetoothDevice()..mergeFromMessage(this);
  BluetoothDevice copyWith(void Function(BluetoothDevice) updates) => super.copyWith((message) => updates(message as BluetoothDevice));
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static BluetoothDevice create() => BluetoothDevice._();
  BluetoothDevice createEmptyInstance() => create();
  static $pb.PbList<BluetoothDevice> createRepeated() => $pb.PbList<BluetoothDevice>();
  @$core.pragma('dart2js:noInline')
  static BluetoothDevice getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BluetoothDevice>(create);
  static BluetoothDevice _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get address => $_getSZ(0);
  @$pb.TagNumber(1)
  set address($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasAddress() => $_has(0);
  @$pb.TagNumber(1)
  void clearAddress() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  BluetoothDevice_Type get type => $_getN(2);
  @$pb.TagNumber(3)
  set type(BluetoothDevice_Type v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasType() => $_has(2);
  @$pb.TagNumber(3)
  void clearType() => clearField(3);
}

