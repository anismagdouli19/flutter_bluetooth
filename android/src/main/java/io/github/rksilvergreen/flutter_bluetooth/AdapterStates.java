package io.github.rksilvergreen.flutter_bluetooth;

import android.util.Log;
import java.util.HashMap;
//import java.util.*;

enum AdapterState {
    TURNING_ON,
    TURNED_ON,
    TURNING_OFF,
    TURNED_OFF;
    private String value;
}

public class AdapterStates {


    AdapterStates() {
        AdapterState[] adpaterStates = AdapterState.values();
        Log.d("FlutterBluetooth", adpaterStates.toString());
        for (AdapterState adapterState : adpaterStates) {
            System.out.printf("[ AdapterState : %s, Value : %s ]%n",adapterState.name(),adapterState);
            Log.d("FlutterBluetooth", adapterState.toString());
        }
    }

    static private HashMap<AdapterState, String> errorMap = new HashMap<AdapterState, String>() {{
        put(AdapterState.TURNING_ON, "TURNING_ON");
        put(AdapterState.TURNED_ON, "TURNED_ON");
        put(AdapterState.TURNING_OFF, "TURNING_OFF");
        put(AdapterState.TURNED_OFF, "TURNED_OFF");
    }};

//    static String getCode(Error error) {
//        return errorMap.get(error).code;
//    }
//
//    static String getMessage(Error error) {
//        return errorMap.get(error).message;
//    }
//
//    static String getDetails(Error error) {
//        return errorMap.get(error).details;
//    }
}
