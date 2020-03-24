package io.github.rksilvergreen.flutter_bluetooth;

import android.util.Log;
import android.content.Context;
import android.content.BroadcastReceiver;
import android.content.Intent;
import android.content.IntentFilter;

import io.flutter.embedding.engine.plugins.FlutterPlugin;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.EventChannel;
import io.flutter.plugin.common.EventChannel.StreamHandler;
import io.flutter.plugin.common.EventChannel.EventSink;

import android.app.Activity;

import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;

import io.github.rksilvergreen.flutter_bluetooth.Proto.AdapterStateMessage.AdapterState;
import io.github.rksilvergreen.flutter_bluetooth.Proto.BondStateMessage.BondState;
import io.github.rksilvergreen.flutter_bluetooth.ProtoMaker;

import java.util.*;

public class EventChannels {
    private static final String TAG = "FlutterBluetooth";
    private static final String NAMESPACE = "flutter_bluetooth";

    private final Context context;
    private final BinaryMessenger binaryMessenger;
    Activity activity;

    private EventSink adapterStateSink;
    private BroadcastReceiver adapterStateReceiver;

    private EventSink discoverySink;
    private BroadcastReceiver discoveryReceiver;
    private static final String ACTION_DISCOVERY_CANCELED = NAMESPACE + "/ACTION_DISCOVERY_CANCELED";

    private EventSink bondStateSink;
    private BroadcastReceiver bondStateReceiver;

    private EventSink connectionStateSink;
    private BroadcastReceiver connectionStateReceiver;

    EventChannels(final Context context, final BinaryMessenger binaryMessenger) {
        this.context = context;
        this.binaryMessenger = binaryMessenger;

        // Adapter State
        {
            adapterStateReceiver = new BroadcastReceiver() {
                @Override
                public void onReceive(Context context, Intent intent) {
                    if (adapterStateSink == null) return;
                    final String action = intent.getAction();
                    final Proto.AdapterStateMessage adapterStateMessage;
                    if (BluetoothAdapter.ACTION_STATE_CHANGED.equals(action)) {
                        final int state = intent.getIntExtra(BluetoothAdapter.EXTRA_STATE, BluetoothDevice.ERROR);
                        if (Arrays.asList(
                                BluetoothAdapter.STATE_TURNING_ON,
                                BluetoothAdapter.STATE_ON,
                                BluetoothAdapter.STATE_TURNING_OFF,
                                BluetoothAdapter.STATE_OFF
                        ).contains(state)) {
                            adapterStateMessage = ProtoMaker.createAdapterStateMessage(state);
                            adapterStateSink.success(adapterStateMessage.toByteArray());
                        }
                    }
                }
            };

            EventChannel adapterStateChannel = new EventChannel(binaryMessenger, NAMESPACE + "/adapterState");

            adapterStateChannel.setStreamHandler(new StreamHandler() {
                @Override
                public void onListen(Object o, EventSink eventSink) {
                    adapterStateSink = eventSink;
                    context.registerReceiver(adapterStateReceiver, new IntentFilter(BluetoothAdapter.ACTION_STATE_CHANGED));
                }

                @Override
                public void onCancel(Object o) {
                    adapterStateSink = null;
                    try {
                        context.unregisterReceiver(adapterStateReceiver);
                    } catch (IllegalArgumentException ex) {
                        // Ignore `Receiver not registered` exception
                    }
                }
            });
        }

        // Discovery
        {
            discoveryReceiver = new BroadcastReceiver() {
                @Override
                public void onReceive(Context context, Intent intent) {
                    if (discoverySink == null) return;
                    final String action = intent.getAction();
                    Log.d(TAG, action);
                    final Proto.DiscoveryMessage discoveryMessage;

                    if (Arrays.asList(
                            BluetoothAdapter.ACTION_DISCOVERY_STARTED,
                            BluetoothAdapter.ACTION_DISCOVERY_FINISHED,
                            ACTION_DISCOVERY_CANCELED
                    ).contains(action)) {
                        discoveryMessage = ProtoMaker.createDiscoveryMessage(action);
                        adapterStateSink.success(discoveryMessage.toByteArray());
                    }

                    else if (Arrays.asList(
                            BluetoothDevice.ACTION_FOUND
                    ).contains(action)) {
                        final BluetoothDevice device = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
                        final int rssi = intent.getShortExtra(BluetoothDevice.EXTRA_RSSI, Short.MIN_VALUE);
                        discoveryMessage = ProtoMaker.createDiscoveryMessage(action, device, rssi);
                        adapterStateSink.success(discoveryMessage.toByteArray());
                    }
                }
            };

            EventChannel discoveryChannel = new EventChannel(binaryMessenger, NAMESPACE + "/discovery");

            discoveryChannel.setStreamHandler(new StreamHandler() {
                @Override
                public void onListen(Object o, EventSink eventSink) {
                    discoverySink = eventSink;
                    IntentFilter intentFilter = new IntentFilter();
                    intentFilter.addAction(BluetoothAdapter.ACTION_DISCOVERY_STARTED);
                    intentFilter.addAction(BluetoothDevice.ACTION_FOUND);
                    intentFilter.addAction(BluetoothAdapter.ACTION_DISCOVERY_FINISHED);
                    intentFilter.addAction(ACTION_DISCOVERY_CANCELED);
                    context.registerReceiver(discoveryReceiver, intentFilter);
                }

                @Override
                public void onCancel(Object o) {
                    discoverySink = null;
                    try {
                        context.unregisterReceiver(discoveryReceiver);
                    } catch (IllegalArgumentException ex) {
                        // Ignore `Receiver not registered` exception
                    }
                }
            });
        }

        // Bond State
        {
            bondStateReceiver = new BroadcastReceiver() {
                @Override
                public void onReceive(Context context, Intent intent) {
                    if (bondStateSink == null) return;
                    final String action = intent.getAction();
                    final Proto.BondStateMessage bondStateMessage;
                    if (BluetoothDevice.ACTION_BOND_STATE_CHANGED.equals(action)) {
                        final BluetoothDevice device = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
                        final int state = intent.getIntExtra(BluetoothDevice.EXTRA_BOND_STATE, BluetoothDevice.ERROR);
                        if (Arrays.asList(
                                BluetoothDevice.BOND_BONDING,
                                BluetoothDevice.BOND_BONDED,
                                BluetoothDevice.BOND_NONE
                        ).contains(state)) {
                            bondStateMessage = ProtoMaker.createBondStateMessage(device, state);
                            bondStateSink.success(bondStateMessage.toByteArray());
                        }
                    }
                }
            };

            EventChannel bondStateChannel = new EventChannel(binaryMessenger, NAMESPACE + "/bondState");

            bondStateChannel.setStreamHandler(new StreamHandler() {
                @Override
                public void onListen(Object o, EventSink eventSink) {
                    bondStateSink = eventSink;
                    context.registerReceiver(bondStateReceiver, new IntentFilter(BluetoothDevice.ACTION_BOND_STATE_CHANGED));
                }

                @Override
                public void onCancel(Object o) {
                    bondStateSink = null;
                    try {
                        context.unregisterReceiver(bondStateReceiver);
                    } catch (IllegalArgumentException ex) {
                        // Ignore `Receiver not registered` exception
                    }
                }
            });
        }

        // Connection State
        {
            connectionStateReceiver = new BroadcastReceiver() {
                @Override
                public void onReceive(Context context, Intent intent) {
                    if (connectionStateSink == null) return;
                    final String action = intent.getAction();
                    final Proto.ConnectionStateMessage connectionStateMessage;
                    if (BluetoothAdapter.ACTION_CONNECTION_STATE_CHANGED.equals(action)) {
                        final BluetoothDevice device = intent.getParcelableExtra(BluetoothDevice.EXTRA_DEVICE);
                        final int state = intent.getIntExtra(BluetoothAdapter.EXTRA_CONNECTION_STATE, BluetoothDevice.ERROR);
                        if (Arrays.asList(
                                BluetoothAdapter.STATE_CONNECTING,
                                BluetoothAdapter.STATE_CONNECTED,
                                BluetoothAdapter.STATE_DISCONNECTING,
                                BluetoothAdapter.STATE_DISCONNECTED
                        ).contains(state)) {
                            connectionStateMessage = ProtoMaker.createConnectionStateMessage(device, state);
                            connectionStateSink.success(connectionStateMessage.toByteArray());
                        }
                    }
                }
            };

            EventChannel connectionStateChannel = new EventChannel(binaryMessenger, NAMESPACE + "/connectionState");

            connectionStateChannel.setStreamHandler(new StreamHandler() {
                @Override
                public void onListen(Object o, EventSink eventSink) {
                    connectionStateSink = eventSink;
                    context.registerReceiver(connectionStateReceiver, new IntentFilter(BluetoothAdapter.ACTION_CONNECTION_STATE_CHANGED));
                }

                @Override
                public void onCancel(Object o) {
                    connectionStateSink = null;
                    try {
                        context.unregisterReceiver(connectionStateReceiver);
                    } catch (IllegalArgumentException ex) {
                        // Ignore `Receiver not registered` exception
                    }
                }
            });
        }
    }
}
