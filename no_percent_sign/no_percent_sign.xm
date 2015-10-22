#import "UIStatusBarComposedData.h"

static BOOL shouldOffset = false;

%hook UIStatusBarBatteryPercentItemView

- (BOOL)updateForNewData:(UIStatusBarComposedData *)data actions:(int)actions {
    BOOL orig = %orig;
    
    int batteryCapacity = [data rawData]->batteryCapacity;
    
    NSString *&_percentString = MSHookIvar<NSString *>(self, "_percentString");
    [_percentString release];
    
    _percentString = [[NSString stringWithFormat:@"%i%@", batteryCapacity, shouldOffset ? @" " : @""] retain];
    
    return orig;
}

- (int)textAlignment {
    return 0;
}

%end

%hook UIStatusBarBatteryItemView

- (id)contentsImage {
    return nil;
}

- (BOOL)_needsAccessoryImage {
    return shouldOffset = %orig;
}

%end