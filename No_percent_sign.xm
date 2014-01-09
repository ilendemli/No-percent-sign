#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <CoreFoundation/CoreFoundation.h>
#import "NPSSettings.h"

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define iOS7UP SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0")

NPSSettings *settings = [[[NPSSettings alloc] init] loadFile];
BOOL shouldShowBatteryIcon = [settings shouldShowBatteryIcon], shouldAddSpaces = FALSE;

%hook UIStatusBarBatteryPercentItemView
-(BOOL)updateForNewData:(id)arg1 actions:(int)arg2 {
    BOOL orig = %orig;
    
	NSString *&_percentString = MSHookIvar<NSString *>(self, "_percentString");
    NSString *newPercentString = [[NSString stringWithFormat:@"%@", _percentString] retain];
    
    if(_percentString && [settings isEnabled]) {
        newPercentString = [[newPercentString stringByReplacingOccurrencesOfString:@"%" withString:@""] retain];
        newPercentString = [[newPercentString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] retain];
        
        if(iOS7UP && shouldAddSpaces && !shouldShowBatteryIcon)
            newPercentString = [[newPercentString stringByAppendingString:@"  "] retain];
        
        [_percentString release];
		_percentString = newPercentString;
        
    } else {
        newPercentString = [[newPercentString stringByAppendingString:@" "] retain];
        [_percentString release];
		_percentString = newPercentString;
    }
    
    return orig;
}

-(float)extraRightPadding {
    return -4;
}

-(int)textAlignment {
    if(iOS7UP && !shouldShowBatteryIcon) return NSTextAlignmentLeft;
    
    return %orig;
}
%end

%hook UIStatusBarBatteryItemView
-(id)contentsImage {
    id _orig = %orig;
    
    if(iOS7UP && !shouldShowBatteryIcon) { _orig = nil; return nil; }
   
    return _orig;
}

-(BOOL)_needsAccessoryImage {
    BOOL _orig = %orig;
    
    if(iOS7UP) shouldAddSpaces = _orig;
    
    return _orig;
}
%end