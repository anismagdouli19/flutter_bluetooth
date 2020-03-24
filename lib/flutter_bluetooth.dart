library flutter_bluetooth;

import 'dart:async';
import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth/gen/proto/flutter_bluetooth.pb.dart' as proto;
import 'package:flutter_bluetooth/gen/proto/flutter_bluetooth.pbserver.dart';

part 'BluetoothAdapter.dart';
part 'BluetoothDevice.dart';
part 'BLTDevice.dart';
part 'BLEDevice.dart';
part 'DualDevice.dart';
part 'UnknownDevice.dart';

const String NAMESPACE = 'flutter_bluetooth';