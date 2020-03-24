package io.github.rksilvergreen.flutter_bluetooth;

import android.util.Log;
import androidx.annotation.NonNull;
import io.flutter.embedding.engine.plugins.FlutterPlugin;
import android.content.Context;

import io.flutter.embedding.engine.plugins.activity.ActivityAware;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import android.app.Activity;
import io.flutter.plugin.common.BinaryMessenger;


import android.Manifest;
import android.content.pm.PackageManager;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;


/** FlutterBluetoothPlugin */
public class FlutterBluetoothPlugin implements FlutterPlugin, ActivityAware {
  private static final String TAG = "FlutterBluetooth";
  private MethodChannels methodChannels;
  private EventChannels eventChannels;
  Activity activity;
//  public static void registerWith(PluginRegistry.Registrar registrar) {
//    final FlutterBluetoothPlugin instance = new FlutterBluetoothPlugin();
//    instance.onAttachedToEngine(registrar.context(), registrar.messenger());
//  }

  @Override
  public void onAttachedToEngine(@NonNull FlutterPluginBinding flutterPluginBinding) {
    Context context = flutterPluginBinding.getApplicationContext();
    BinaryMessenger binaryMessenger = flutterPluginBinding.getFlutterEngine().getDartExecutor();
    onAttachedToEngine(context, binaryMessenger);
  }

  private void onAttachedToEngine(Context context, BinaryMessenger binaryMessenger) {
    Log.d(TAG, "in onAttachedToEngine");
    methodChannels = new MethodChannels(context, binaryMessenger);
    eventChannels = new EventChannels(context, binaryMessenger);
//    new AdapterStates();
//    Protos.AdapterStateMessage.Builder p = Protos.AdapterStateMessage.newBuilder();
  }

  @Override
  public void onDetachedFromEngine(@NonNull FlutterPluginBinding binding) {
  }

  @Override
  public void onAttachedToActivity(ActivityPluginBinding activityPluginBinding) {
    activity = activityPluginBinding.getActivity();
    methodChannels.activity = activity;
    eventChannels.activity = activity;
  }

  @Override
  public void onDetachedFromActivityForConfigChanges() {
    // TODO: the Activity your plugin was attached to was destroyed to change configuration.
    // This call will be followed by onReattachedToActivityForConfigChanges().
  }

  @Override
  public void onReattachedToActivityForConfigChanges(ActivityPluginBinding activityPluginBinding) {
    // TODO: your plugin is now attached to a new Activity after a configuration change.
  }

  @Override
  public void onDetachedFromActivity() {
    // TODO: your plugin is no longer associated with an Activity. Clean up references.
  }


}