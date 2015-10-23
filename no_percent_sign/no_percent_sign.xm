#import "NPSSettings.h"
#import "UIStatusBarComposedData.h"

static BOOL shouldOffset = false;
static BOOL shouldShowBatteryIcon = false;

%hook UIStatusBarBatteryPercentItemView

- (BOOL)updateForNewData:(UIStatusBarComposedData *)data actions:(int)actions {
    BOOL orig = %orig;
    
    int batteryCapacity = [data rawData]->batteryCapacity;
    
    NSString *&_percentString = MSHookIvar<NSString *>(self, "_percentString");
    [_percentString release];
    
    _percentString = [[NSString stringWithFormat:@"%i%@", batteryCapacity, shouldOffset && !shouldShowBatteryIcon ? @" " : @""] retain];
    
    return orig;
}

- (int)textAlignment {
    return shouldShowBatteryIcon ? %orig : 0;
}

%end

%hook UIStatusBarBatteryItemView

- (id)contentsImage {
    if (shouldShowBatteryIcon) return %orig;
    
    return nil;
}

- (BOOL)_needsAccessoryImage {
    return shouldOffset = %orig;
}

%end

%ctor {
    shouldShowBatteryIcon = [[NPSSettings sharedManager] shouldShowBatteryIcon];
}