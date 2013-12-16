#line 1 "/Users/iLS/Dropbox/Projects/No percent sign/No percent sign/No_percent_sign.xm"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <substrate.h>

#include <logos/logos.h>
#include <substrate.h>
@class UIStatusBarBatteryPercentItemView; 
static BOOL (*_logos_orig$_ungrouped$UIStatusBarBatteryPercentItemView$updateForNewData$actions$)(UIStatusBarBatteryPercentItemView*, SEL, id, int); static BOOL _logos_method$_ungrouped$UIStatusBarBatteryPercentItemView$updateForNewData$actions$(UIStatusBarBatteryPercentItemView*, SEL, id, int); static float (*_logos_orig$_ungrouped$UIStatusBarBatteryPercentItemView$extraRightPadding)(UIStatusBarBatteryPercentItemView*, SEL); static float _logos_method$_ungrouped$UIStatusBarBatteryPercentItemView$extraRightPadding(UIStatusBarBatteryPercentItemView*, SEL); 

#line 5 "/Users/iLS/Dropbox/Projects/No percent sign/No percent sign/No_percent_sign.xm"

static BOOL _logos_method$_ungrouped$UIStatusBarBatteryPercentItemView$updateForNewData$actions$(UIStatusBarBatteryPercentItemView* self, SEL _cmd, id arg1, int arg2) {
    BOOL orig = _logos_orig$_ungrouped$UIStatusBarBatteryPercentItemView$updateForNewData$actions$(self, _cmd, arg1, arg2);
    
    NSString *newPercentString;
	NSString *&_percentString = MSHookIvar<NSString *>(self, "_percentString");
    
    if(_percentString) {
        newPercentString = _percentString;
        
        newPercentString = [[newPercentString stringByReplacingOccurrencesOfString:@"%" withString:@""] retain];
        newPercentString = [[newPercentString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] retain];
        
        [_percentString release];
		
		_percentString = newPercentString;
    }
    
    return orig;
}

static float _logos_method$_ungrouped$UIStatusBarBatteryPercentItemView$extraRightPadding(UIStatusBarBatteryPercentItemView* self, SEL _cmd) {
    return -4;
}

static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UIStatusBarBatteryPercentItemView = objc_getClass("UIStatusBarBatteryPercentItemView"); MSHookMessageEx(_logos_class$_ungrouped$UIStatusBarBatteryPercentItemView, @selector(updateForNewData:actions:), (IMP)&_logos_method$_ungrouped$UIStatusBarBatteryPercentItemView$updateForNewData$actions$, (IMP*)&_logos_orig$_ungrouped$UIStatusBarBatteryPercentItemView$updateForNewData$actions$);MSHookMessageEx(_logos_class$_ungrouped$UIStatusBarBatteryPercentItemView, @selector(extraRightPadding), (IMP)&_logos_method$_ungrouped$UIStatusBarBatteryPercentItemView$extraRightPadding, (IMP*)&_logos_orig$_ungrouped$UIStatusBarBatteryPercentItemView$extraRightPadding);} }
#line 30 "/Users/iLS/Dropbox/Projects/No percent sign/No percent sign/No_percent_sign.xm"
