#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <substrate.h>

%hook UIStatusBarBatteryPercentItemView
-(BOOL) updateForNewData:(id)arg1 actions:(int)arg2 {
    BOOL orig = %orig;
    
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

-(float) extraRightPadding {
    return -4;
}
%end