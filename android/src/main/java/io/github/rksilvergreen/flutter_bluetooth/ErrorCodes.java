package io.github.rksilvergreen.flutter_bluetooth;

import java.util.*;
import java.util.HashMap;

enum Error {
    ADAPTER_NOT_AVAILABLE,
    ADAPTER_IS_OFF,
    ADAPTER_IS_ON
}

class ErrorCodes {

    static class ErrorData {
        String code;
        String message;
        String details;

        ErrorData(String code, String message, String details) {
            this.code= code;
            this.message = message;
            this.details = details;
        }
    }

    static private HashMap<Error, ErrorData> errorMap = new HashMap<Error, ErrorData>() {{
        put(Error.ADAPTER_NOT_AVAILABLE, new ErrorData("ADAPTER_NOT_AVAILABLE", "Cannot locate bluetooth adapter on device", null));
        put(Error.ADAPTER_IS_OFF, new ErrorData("ADAPTER_IS_OFF", "Bluetooth adapter is switched off", null));
        put(Error.ADAPTER_IS_ON, new ErrorData("ADAPTER_IS_ON", "Bluetooth adapter is already switched on", null));
    }};

    static String getCode(Error error) {
        return errorMap.get(error).code;
    }

    static String getMessage(Error error) {
        return errorMap.get(error).message;
    }

    static String getDetails(Error error) {
        return errorMap.get(error).details;
    }


}
