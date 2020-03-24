import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_bluetooth/flutter_bluetooth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'flutter_bluetooth',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'flutter_bluetooth'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BluetoothAdapter bluetoothAdapter;

  @override
  initState() {
    super.initState();
    bluetoothAdapter = BluetoothAdapter.instance;
    bluetoothAdapter
      ..onTurningOn = () {
        print('onTurningOn');
      }
      ..onTurnedOn = () {
        print('onTurnedOn');
      }
      ..onTurningOff = () {
        print('onTurningOff');
      }
      ..onTurnedOff = () {
        print('onTurnedOff');
      };

    bluetoothAdapter
      ..onDiscoveryStart = () {
        print('onDiscoveryStart');
      }
      ..onDeviceDiscovered = (d) {
        print('onDeviceDiscovered: ${d.name}');
      }
      ..onDiscoveryCompleted = () {
        print('onDiscoveryCompleted');
      }
      ..onDiscoveryCanceled = () {
        print('onDiscoveryCanceled');
      };
  }

  callCommand() async {
    var result = await bluetoothAdapter.turnOn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Wrap(
          direction: Axis.horizontal,
          spacing: 20,
          children: <Widget>[
            FlatButton(
              color: Colors.lime,
              onPressed: () async {
                var result = await bluetoothAdapter.isAvailable();
                print(result);
              },
              child: Text('isAvailable'),
            ),
            FlatButton(
              color: Colors.lime,
              onPressed: () async {
                var result = await bluetoothAdapter.isTurnedOn();
                print(result);
              },
              child: Text('isTurnedOn'),
            ),
            FlatButton(
              color: Colors.lime,
              onPressed: () async {
                var result = await bluetoothAdapter.turnOnWithPermission();
              },
              child: Text('turnOnWithPermission'),
            ),
            FlatButton(
              color: Colors.lime,
              onPressed: () async {
                var result = await bluetoothAdapter.turnOn();
              },
              child: Text('turnOn'),
            ),
          ],
        )
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: callCommand,
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

/// Bluetooth Enabled/Disabled: ACTION_STATE_CHANGED
/// Discovery started: ACTION_DISCOVERY_STARTED
/// Device found: ACTION_FOUND
/// Discovery stopped: ACTION_DISCOVERY_FINISHED
/// Pairing request received: ACTION_PAIRING_REQUEST
/// Connection state changed: 	ACTION_CONNECTION_STATE_CHANGED
/// Bond state changed: ACTION_BOND_STATE_CHANGED
/// /// Is BLE supported
