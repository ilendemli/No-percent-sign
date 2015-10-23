//
//  NPSSettings.m
//  no_percent_sign
//
//  Created by Muhammet Ilendemli on 23.10.15.
//
//

#import <UIKit/UIKit.h>
#import "NPSSettings.h"

@implementation NPSSettings {
    NSDictionary *dict;
}

+ (id)sharedManager {
    static NPSSettings *sharedManager = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        sharedManager = [[self alloc] init];
    });
    
    return sharedManager;
}

- (id)init {
    if (self = [super init]) {
        dict = [NSDictionary dictionaryWithContentsOfFile:@"/var/mobile/Library/Preferences/info.ilendemli.no_percent_sign.plist"];
    }
    
    return self;
}

- (BOOL)shouldShowBatteryIcon {
    return [dict objectForKey:@"shouldShowBatteryIcon"] ? [[dict objectForKey:@"shouldShowBatteryIcon"] boolValue] : FALSE;
}

- (BOOL)isEnabled {
    return [dict objectForKey:@"isEnabled"] ? [[dict objectForKey:@"isEnabled"] boolValue] : FALSE;
}

- (void)dealloc {
    [super dealloc];
}

@end
