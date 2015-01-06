//
//  DBPrivacyHelperDataSource.m
//  DBPrivacyHelperExample
//
//  Created by iBo on 06/01/15.
//  Copyright (c) 2015 iBo. All rights reserved.
//

#import "DBPrivacyHelperDataSource.h"

#ifndef DBPrivacyHelperLocalizableStrings
#define DBPrivacyHelperLocalizableStrings(key) \
NSLocalizedStringFromTable(key, @"DBPrivacyHelperLocalizable", nil)
#endif

@implementation NSString (DBPrivacyHelper)

- (NSString *) localizedString {
    return DBPrivacyHelperLocalizableStrings(self);
}

@end

@implementation DBPrivacyHelperDataSource

- (NSString *) headerText:(NSString *)string {
    return [NSString stringWithFormat:[@"Allow access to \"%@\"\nwith these steps:" localizedString], string];
}

- (NSString *) typeTitle:(NSString *)string {
    return [NSString stringWithFormat:[@"Tap on \"%@\"" localizedString], string];
}

- (NSString *) typeAllowText:(NSString *)string {
    return [NSString stringWithFormat:[@"Allow your application to use \"%@\"" localizedString], string];
}

- (NSDictionary *) cellData {
    return @{ @(DBPrivacyTypePhoto):@{ @"header":[self headerText:[@"Photos" localizedString]],
                                       @"steps":@[ @{ @"desc":[@"Open device settings" localizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" localizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self typeTitle:[@"Photos" localizedString]], @"icon":@"dbph_photoIcon" }, @{ @"desc":[self typeAllowText:[@"Photos" localizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeCamera):@{ @"header":[self headerText:[@"Camera" localizedString]],
                                        @"steps":@[ @{ @"desc":[@"Open device settings" localizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" localizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self typeTitle:[@"Camera" localizedString]], @"icon":@"dbph_cameraIcon" }, @{ @"desc":[self typeAllowText:[@"Camera" localizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeLocation):@{ @"header":[self headerText:[@"Location Services" localizedString]],
                                          @"steps":@[ @{ @"desc":[@"Open device settings" localizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" localizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self typeTitle:[@"Location Services" localizedString]], @"icon":@"dbph_localizationIcon" }, @{ @"desc":[self typeAllowText:[@"Location Services" localizedString]], @"icon":@"dbph_checkIcon" }]},
              
              @(DBPrivacyTypeHealth):@{ @"header":[self headerText:[@"Health" localizedString]],
                                        @"steps":@[ @{ @"desc":[@"Open device settings" localizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" localizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self typeTitle:[@"Health" localizedString]], @"icon":@"dbph_healthIcon" }, @{ @"desc":[self typeAllowText:[@"Health" localizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeHomeKit):@{ @"header":[self headerText:[@"HomeKit" localizedString]],
                                         @"steps":@[ @{ @"desc":[@"Open device settings" localizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" localizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self typeTitle:[@"HomeKit" localizedString]], @"icon":@"dbph_homekitIcon" }, @{ @"desc":[self typeAllowText:[@"HomeKit" localizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeMotionActivity):@{ @"header":[self headerText:[@"Motion Activity" localizedString]],
                                                @"steps":@[ @{ @"desc":[@"Open device settings" localizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" localizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self typeTitle:[@"Motion Activity" localizedString]], @"icon":@"dbph_motionIcon" }, @{ @"desc":[self typeAllowText:[@"Motion Activity" localizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeContacts):@{ @"header":[self headerText:[@"Contacts" localizedString]],
                                          @"steps":@[ @{ @"desc":[@"Open device settings" localizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" localizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self typeTitle:[@"Contacts" localizedString]], @"icon":@"dbph_contactsIcon" }, @{ @"desc":[self typeAllowText:[@"Contacts" localizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeNotifications):@{ @"header":[self headerText:[@"Notifications" localizedString]],
                                               @"steps":@[ @{ @"desc":[@"Open device settings" localizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[self typeTitle:[@"Notifications" localizedString]], @"icon":@"dbph_notificationsIcon" }, @{ @"desc":[self typeTitle:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"]], @"icon":self.appIcon ?: @"dbph_appIcon" }, @{ @"desc":[self typeAllowText:[@"Notifications" localizedString]], @"icon":@"dbph_switchIcon" }, @{ @"desc":[@"Select the alert style you prefer" localizedString], @"icon":@"dbph_alertIcon" }]} };
}

@end