typedef struct {
    BOOL itemIsEnabled[27];
    BOOL timeString[64];
    int gsmSignalStrengthRaw;
    int gsmSignalStrengthBars;
    BOOL serviceString[100];
    BOOL serviceCrossfadeString[100];
    BOOL serviceImages[2][100];
    BOOL operatorDirectory[1024];
    unsigned int serviceContentType;
    int wifiSignalStrengthRaw;
    int wifiSignalStrengthBars;
    unsigned int dataNetworkType;
    int batteryCapacity;
    unsigned int batteryState;
    BOOL batteryDetailString[150];
    int bluetoothBatteryCapacity;
    int thermalColor;
    unsigned int thermalSunlightMode : 1;
    unsigned int slowActivity : 1;
    unsigned int syncActivity : 1;
    BOOL activityDisplayId[256];
    unsigned int bluetoothConnected : 1;
    unsigned int displayRawGSMSignal : 1;
    unsigned int displayRawWifiSignal : 1;
    unsigned int locationIconType : 1;
    unsigned int quietModeInactive : 1;
    unsigned int tetheringConnectionCount;
    unsigned int batterySaverModeActive : 1;
    BOOL breadcrumbTitle[256];
    BOOL breadcrumbSecondaryTitle[256];
} StatusBarData;

@interface UIStatusBarComposedData : NSObject
- (StatusBarData *) rawData;
@end