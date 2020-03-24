package io.github.rksilvergreen.flutter_bluetooth;

import android.annotation.TargetApi;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.BluetoothGatt;
import android.bluetooth.BluetoothGattCharacteristic;
import android.bluetooth.BluetoothGattDescriptor;
import android.bluetooth.BluetoothGattService;
import android.bluetooth.BluetoothProfile;
import android.bluetooth.le.ScanRecord;
import android.bluetooth.le.ScanResult;
import android.os.Build;
import android.os.Parcel;
import android.os.ParcelUuid;
import android.util.Log;
import android.util.SparseArray;

import com.google.protobuf.ByteString;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import io.github.rksilvergreen.flutter_bluetooth.Proto.AdapterStateMessage;
import io.github.rksilvergreen.flutter_bluetooth.Proto.AdapterStateMessage.AdapterState;
import io.github.rksilvergreen.flutter_bluetooth.Proto.BondStateMessage;
import io.github.rksilvergreen.flutter_bluetooth.Proto.BondStateMessage.BondState;
import io.github.rksilvergreen.flutter_bluetooth.Proto.ConnectionStateMessage;
import io.github.rksilvergreen.flutter_bluetooth.Proto.ConnectionStateMessage.ConnectionState;
import io.github.rksilvergreen.flutter_bluetooth.Proto.DiscoveryMessage;
import io.github.rksilvergreen.flutter_bluetooth.Proto.DiscoveryMessage.DiscoveryAction;
import io.github.rksilvergreen.flutter_bluetooth.Proto.DiscoveryResult;

public class ProtoMaker {

    private static final String NAMESPACE = "flutter_bluetooth";
    private static final String ACTION_DISCOVERY_CANCELED = NAMESPACE + "/ACTION_DISCOVERY_CANCELED";

    private static HashMap<Integer, AdapterState> adapterStateMap = new HashMap<Integer, AdapterState>() {{
        put(BluetoothAdapter.STATE_TURNING_ON, AdapterState.TURNING_ON);
        put(BluetoothAdapter.STATE_ON, AdapterState.TURNED_ON);
        put(BluetoothAdapter.STATE_TURNING_OFF, AdapterState.TURNING_OFF);
        put(BluetoothAdapter.STATE_OFF, AdapterState.TURNED_OFF);
    }};

    private static HashMap<String, DiscoveryAction> discoveryActionMap = new HashMap<String, DiscoveryAction>() {{
        put(BluetoothAdapter.ACTION_DISCOVERY_STARTED, DiscoveryAction.START);
        put(BluetoothDevice.ACTION_FOUND, DiscoveryAction.FOUND);
        put(BluetoothAdapter.ACTION_DISCOVERY_FINISHED, DiscoveryAction.COMPLETE);
        put(ACTION_DISCOVERY_CANCELED, DiscoveryAction.CANCLED);
    }};

    private static HashMap<Integer, BondState> bondStateMap = new HashMap<Integer, BondState>() {{
        put(BluetoothDevice.BOND_BONDING, BondState.BONDING);
        put(BluetoothDevice.BOND_BONDED, BondState.BONDED);
        put(BluetoothDevice.BOND_NONE, BondState.NONE);
    }};

    private static HashMap<Integer, ConnectionState> connectionStateMap = new HashMap<Integer, ConnectionState>() {{
        put(BluetoothAdapter.STATE_CONNECTING, ConnectionState.CONNECTING);
        put(BluetoothAdapter.STATE_CONNECTED, ConnectionState.CONNECTED);
        put(BluetoothAdapter.STATE_DISCONNECTING, ConnectionState.DISCONNECTING);
        put(BluetoothAdapter.STATE_DISCONNECTED, ConnectionState.DISCONNECTED);
    }};

    private static HashMap<Integer, Proto.BluetoothDevice.Type> typeMap = new HashMap<Integer, Proto.BluetoothDevice.Type>() {{
        put(BluetoothDevice.DEVICE_TYPE_CLASSIC, Proto.BluetoothDevice.Type.CLASSIC);
        put(BluetoothDevice.DEVICE_TYPE_LE, Proto.BluetoothDevice.Type.LE);
        put(BluetoothDevice.DEVICE_TYPE_DUAL, Proto.BluetoothDevice.Type.DUAL);
        put(BluetoothDevice.DEVICE_TYPE_UNKNOWN, Proto.BluetoothDevice.Type.UNKNOWN);
    }};

    static AdapterStateMessage createAdapterStateMessage(int state) {
        AdapterStateMessage.Builder p = AdapterStateMessage.newBuilder();
        p.setState(adapterStateMap.get(state));
        return p.build();
    }

    static DiscoveryMessage createDiscoveryMessage(String action) {
        DiscoveryMessage.Builder p = DiscoveryMessage.newBuilder();
        p.setAction(discoveryActionMap.get(action));
        return p.build();
    }

    static DiscoveryMessage createDiscoveryMessage(String action, BluetoothDevice device, int rssi) {
        DiscoveryMessage.Builder p = DiscoveryMessage.newBuilder();
        p.setAction(discoveryActionMap.get(action));
        p.setResult(createDiscoveryResult(device, rssi));
        return p.build();
    }

    private static DiscoveryResult createDiscoveryResult(BluetoothDevice device, int rssi) {
        Proto.DiscoveryResult.Builder p = Proto.DiscoveryResult.newBuilder();
        p.setDevice(createBluetoothDevice(device));
        p.setRssi(rssi);
        return p.build();
    }

    static BondStateMessage createBondStateMessage(BluetoothDevice device, int state) {
        BondStateMessage.Builder p = BondStateMessage.newBuilder();
        p.setDevice(createBluetoothDevice(device));
        p.setState(bondStateMap.get(state));
        return p.build();
    }

    static ConnectionStateMessage createConnectionStateMessage(BluetoothDevice device, int state) {
        ConnectionStateMessage.Builder p = ConnectionStateMessage.newBuilder();
        p.setDevice(createBluetoothDevice(device));
        p.setState(connectionStateMap.get(state));
        return p.build();
    }

    private static Proto.BluetoothDevice createBluetoothDevice(BluetoothDevice device) {
        Proto.BluetoothDevice.Builder p = Proto.BluetoothDevice.newBuilder();
        p.setAddress(device.getAddress());
        p.setName(device.getName());
        p.setType(typeMap.get(device.getType()));
        return p.build();
    }


}
