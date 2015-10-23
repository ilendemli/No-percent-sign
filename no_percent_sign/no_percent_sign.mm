#line 1 "/Users/milendemli/Projects/no percent sign/no_percent_sign/no_percent_sign.xm"
#import "NPSSettings.h"
#import "UIStatusBarComposedData.h"

static BOOL shouldOffset = false;
static BOOL shouldShowBatteryIcon = false;


#include <substrate.h>
@class UIStatusBarBatteryItemView; @class UIStatusBarBatteryPercentItemView; 
static BOOL (*_logos_orig$_ungrouped$UIStatusBarBatteryPercentItemView$updateForNewData$actions$)(UIStatusBarBatteryPercentItemView*, SEL, UIStatusBarComposedData *, int); static BOOL _logos_method$_ungrouped$UIStatusBarBatteryPercentItemView$updateForNewData$actions$(UIStatusBarBatteryPercentItemView*, SEL, UIStatusBarComposedData *, int); static int (*_logos_orig$_ungrouped$UIStatusBarBatteryPercentItemView$textAlignment)(UIStatusBarBatteryPercentItemView*, SEL); static int _logos_method$_ungrouped$UIStatusBarBatteryPercentItemView$textAlignment(UIStatusBarBatteryPercentItemView*, SEL); static id (*_logos_orig$_ungrouped$UIStatusBarBatteryItemView$contentsImage)(UIStatusBarBatteryItemView*, SEL); static id _logos_method$_ungrouped$UIStatusBarBatteryItemView$contentsImage(UIStatusBarBatteryItemView*, SEL); static BOOL (*_logos_orig$_ungrouped$UIStatusBarBatteryItemView$_needsAccessoryImage)(UIStatusBarBatteryItemView*, SEL); static BOOL _logos_method$_ungrouped$UIStatusBarBatteryItemView$_needsAccessoryImage(UIStatusBarBatteryItemView*, SEL); 

#line 7 "/Users/milendemli/Projects/no percent sign/no_percent_sign/no_percent_sign.xm"


static BOOL _logos_method$_ungrouped$UIStatusBarBatteryPercentItemView$updateForNewData$actions$(UIStatusBarBatteryPercentItemView* self, SEL _cmd, UIStatusBarComposedData * data, int actions) {
    BOOL orig = _logos_orig$_ungrouped$UIStatusBarBatteryPercentItemView$updateForNewData$actions$(self, _cmd, data, actions);
    
    int batteryCapacity = [data rawData]->batteryCapacity;
    
    NSString *&_percentString = MSHookIvar<NSString *>(self, "_percentString");
    [_percentString release];
    
    _percentString = [[NSString stringWithFormat:@"%i%@", batteryCapacity, shouldOffset && !shouldShowBatteryIcon ? @" " : @""] retain];
    
    return orig;
}

static int _logos_method$_ungrouped$UIStatusBarBatteryPercentItemView$textAlignment(UIStatusBarBatteryPercentItemView* self, SEL _cmd) {
    return shouldShowBatteryIcon ? _logos_orig$_ungrouped$UIStatusBarBatteryPercentItemView$textAlignment(self, _cmd) : 0;
}





static id _logos_method$_ungrouped$UIStatusBarBatteryItemView$contentsImage(UIStatusBarBatteryItemView* self, SEL _cmd) {
    if (shouldShowBatteryIcon) return _logos_orig$_ungrouped$UIStatusBarBatteryItemView$contentsImage(self, _cmd);
    
    return nil;
}

static BOOL _logos_method$_ungrouped$UIStatusBarBatteryItemView$_needsAccessoryImage(UIStatusBarBatteryItemView* self, SEL _cmd) {
    return shouldOffset = _logos_orig$_ungrouped$UIStatusBarBatteryItemView$_needsAccessoryImage(self, _cmd);
}



static __attribute__((constructor)) void _logosLocalCtor_d26df6f8() {
    shouldShowBatteryIcon = [[NPSSettings sharedManager] shouldShowBatteryIcon];
}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UIStatusBarBatteryPercentItemView = objc_getClass("UIStatusBarBatteryPercentItemView"); MSHookMessageEx(_logos_class$_ungrouped$UIStatusBarBatteryPercentItemView, @selector(updateForNewData:actions:), (IMP)&_logos_method$_ungrouped$UIStatusBarBatteryPercentItemView$updateForNewData$actions$, (IMP*)&_logos_orig$_ungrouped$UIStatusBarBatteryPercentItemView$updateForNewData$actions$);MSHookMessageEx(_logos_class$_ungrouped$UIStatusBarBatteryPercentItemView, @selector(textAlignment), (IMP)&_logos_method$_ungrouped$UIStatusBarBatteryPercentItemView$textAlignment, (IMP*)&_logos_orig$_ungrouped$UIStatusBarBatteryPercentItemView$textAlignment);Class _logos_class$_ungrouped$UIStatusBarBatteryItemView = objc_getClass("UIStatusBarBatteryItemView"); MSHookMessageEx(_logos_class$_ungrouped$UIStatusBarBatteryItemView, @selector(contentsImage), (IMP)&_logos_method$_ungrouped$UIStatusBarBatteryItemView$contentsImage, (IMP*)&_logos_orig$_ungrouped$UIStatusBarBatteryItemView$contentsImage);MSHookMessageEx(_logos_class$_ungrouped$UIStatusBarBatteryItemView, @selector(_needsAccessoryImage), (IMP)&_logos_method$_ungrouped$UIStatusBarBatteryItemView$_needsAccessoryImage, (IMP*)&_logos_orig$_ungrouped$UIStatusBarBatteryItemView$_needsAccessoryImage);} }
#line 45 "/Users/milendemli/Projects/no percent sign/no_percent_sign/no_percent_sign.xm"
