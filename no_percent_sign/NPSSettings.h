//
//  NPSSettings.h
//  no_percent_sign
//
//  Created by Muhammet Ilendemli on 23.10.15.
//
//

#import <Foundation/Foundation.h>

@interface NPSSettings : NSObject

+ (id)sharedManager;
- (BOOL)shouldShowBatteryIcon;
- (BOOL)isEnabled;

@end
