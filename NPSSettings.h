#define SETTINGSPATH @"/var/mobile/Library/Preferences/org.iLendSoft.No-percent-sign.plist"

@interface NPSSettings : NSObject {
    NSDictionary *settings;
    BOOL shouldShowBatteryIcon, isEnabled;
}

-(NPSSettings *)init;
-(NPSSettings *)loadFile;
-(BOOL)shouldShowBatteryIcon;
-(void)dealloc;
@end

@implementation NPSSettings
-(NPSSettings *)init {
    settings = [[NSDictionary alloc] init];
    shouldShowBatteryIcon = FALSE;
    
    return self;
}

-(NPSSettings *)loadFile {
    settings = [[NSDictionary alloc] initWithContentsOfFile:SETTINGSPATH];
    shouldShowBatteryIcon = [settings objectForKey:@"battery"] ? [[settings objectForKey:@"battery"] boolValue] : FALSE;
    
    return self;
}

-(BOOL)shouldShowBatteryIcon {
	return shouldShowBatteryIcon;
}

-(void)dealloc {
    [settings release];
    [super dealloc];
}

-(BOOL)isEnabled {
    settings = [[NSDictionary alloc] initWithContentsOfFile:SETTINGSPATH];
    isEnabled = [settings objectForKey:@"enabled"] ? [[settings objectForKey:@"enabled"] boolValue] : TRUE;
	return isEnabled;
}
@end
