//
//  RNAlertTimer.m
//  FictionalJourney
//
//  Created by Dillon Hafer on 2/5/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

#import "RNAlertTimer.h"

@implementation RNAlertTimer

RCT_EXPORT_MODULE()

RCT_EXPORT_METHOD(writeFile:(NSString *)fileName
                  withContents:(NSString *)contents
                  errorCallback:(RCTResponseSenderBlock)failureCallback
                  callback:(RCTResponseSenderBlock)successCallback) {
  
  [self scheduleNotification];
  
  successCallback(@[@"Write method called"]);
}

- (void)scheduleNotification
{
  UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
  UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
  [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
  
  UILocalNotification *locNot = [[UILocalNotification alloc] init];
  locNot.fireDate             = [NSDate dateWithTimeIntervalSinceNow:5];
  locNot.alertTitle = @"Hey";
  locNot.alertBody = @"Listen!";
  locNot.applicationIconBadgeNumber = 1986;
  locNot.soundName = UILocalNotificationDefaultSoundName;
  locNot.timeZone = [NSTimeZone defaultTimeZone];
  
  NSLog(@"Started timer!");
  [[UIApplication sharedApplication] scheduleLocalNotification:locNot];
}

@end
