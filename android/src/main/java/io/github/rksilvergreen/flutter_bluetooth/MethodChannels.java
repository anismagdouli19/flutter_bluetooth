package io.github.rksilvergreen.flutter_bluetooth;

import android.Manifest;
import android.content.pm.PackageManager;
import android.util.Log;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothManager;
import android.content.Context;

import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import android.app.Activity;
import android.content.Intent;
import android.content.IntentFilter;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.common.MethodChannel.Result;
import io.flutter.plugin.common.MethodChannel.MethodCallHandler;

public class MethodChannels implements MethodCallHandler {
    private static final String TAG = "FlutterBluetooth";
    private static final String NAMESPACE = "flutter_bluetooth";

    private final Context context;
    private final BinaryMessenger binaryMessenger;
    Activity activity;
    private Result result;

    private static BluetoothManager bluetoothManager;
    private static BluetoothAdapter bluetoothAdapter;

    // Permissions and request constants
    private static final int REQUEST_COARSE_LOCATION_PERMISSIONS = 1451;
    private static final int REQUEST_ENABLE_BLUETOOTH = 1337;
    private static final int REQUEST_DISCOVERABLE_BLUETOOTH = 2137;

    MethodChannels(Context context, BinaryMessenger binaryMessenger) {
        Log.d(TAG, "in MethodChannels Constructor");
        this.context = context;
        this.binaryMessenger = binaryMessenger;

        final MethodChannel channel = new MethodChannel(binaryMessenger, NAMESPACE + "/methods");
        channel.setMethodCallHandler(this);

        bluetoothManager = (BluetoothManager) context.getSystemService(Context.BLUETOOTH_SERVICE);
        bluetoothAdapter = bluetoothManager.getAdapter();
    }

    private void ensurePermissions() {
        if (
                ContextCompat.checkSelfPermission(activity,
                        Manifest.permission.ACCESS_COARSE_LOCATION)
                        != PackageManager.PERMISSION_GRANTED
        ) {
            ActivityCompat.requestPermissions(activity,
                    new String[]{Manifest.permission.ACCESS_COARSE_LOCATION},
                    REQUEST_COARSE_LOCATION_PERMISSIONS);
        }
    }

    private void returnError(Error error) {
        String code = ErrorCodes.getCode(error);
        String message = ErrorCodes.getMessage(error);
        String details = ErrorCodes.getDetails(error);
        result.error(code, message, details);
    }

    @Override
    public void onMethodCall(@NonNull MethodCall call, @NonNull Result result) {
        Log.d(TAG, "in onMethodCall: " + call.method);
        this.result = result;

        if ("isAvailable".equals(call.method)) {
            ensurePermissions();
            result.success(bluetoothAdapter != null);
        }

        // If adapter is unavailable
        else if (bluetoothAdapter == null) {
            returnError(Error.ADAPTER_NOT_AVAILABLE);
        }

        else if ("isEnabled".equals(call.method)) {
            result.success(bluetoothAdapter.isEnabled());
        }

        else if ("enableWithPermission".equals(call.method)) {
            if (!bluetoothAdapter.isEnabled()) {
                Intent intent = new Intent(BluetoothAdapter.ACTION_REQUEST_ENABLE);
                ActivityCompat.startActivityForResult(activity, intent, REQUEST_ENABLE_BLUETOOTH, null);
            }
            else
                returnError(Error.ADAPTER_IS_ON);
        }
        else if ("enable".equals(call.method)) {
            if (!bluetoothAdapter.isEnabled())
                bluetoothAdapter.enable();
            else
                returnError(Error.ADAPTER_IS_ON);
        }

        // If adapter is off
        else if (!bluetoothAdapter.isEnabled()) {
            returnError(Error.ADAPTER_IS_OFF);
        }

        // If adapter is available and on
        else {

            switch (call.method) {
                case "disable":
                    break;
                case "startDiscovery":
                    break;
                default:
                    // default stuff
                    break;
            }
        }

    }
}
