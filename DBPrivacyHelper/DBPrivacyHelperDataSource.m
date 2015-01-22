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

- (NSString *) dbph_LocalizedString {
    return DBPrivacyHelperLocalizableStrings(self);
}

@end

@interface DBPrivacyHelperDataSource () {
    NSDictionary *_cellAttributes;
}
@end

@implementation DBPrivacyHelperDataSource

- (instancetype) init {
    self = [super init];
    if (self) {
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        paragraphStyle.alignment = NSTextAlignmentLeft;
        
        _cellAttributes = @{ NSFontAttributeName:[UIFont boldSystemFontOfSize:12.0], NSParagraphStyleAttributeName:paragraphStyle };
    }
    return self;
}

- (NSString *) headerText:(NSString *)string {
    return [NSString stringWithFormat:[@"Allow access to \"%@\"\nwith these steps:" dbph_LocalizedString], string];
}

- (NSString *) typeTitle:(NSString *)string {
    return [NSString stringWithFormat:[@"Tap on \"%@\"" dbph_LocalizedString], string];
}

- (NSString *) typeAllowText:(NSString *)string {
    return [NSString stringWithFormat:[@"Allow your application to use \"%@\"" dbph_LocalizedString], string];
}

- (NSDictionary *) cellData {
    return @{ @(DBPrivacyTypePhoto):@{ @"header":[self headerText:[@"Photos" dbph_LocalizedString]],
                                       @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self typeTitle:[@"Photos" dbph_LocalizedString]], @"icon":@"dbph_photoIcon" }, @{ @"desc":[self typeAllowText:[@"Photos" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeCamera):@{ @"header":[self headerText:[@"Camera" dbph_LocalizedString]],
                                        @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self typeTitle:[@"Camera" dbph_LocalizedString]], @"icon":@"dbph_cameraIcon" }, @{ @"desc":[self typeAllowText:[@"Camera" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeLocation):@{ @"header":[self headerText:[@"Location Services" dbph_LocalizedString]],
                                          @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self typeTitle:[@"Location Services" dbph_LocalizedString]], @"icon":@"dbph_localizationIcon" }, @{ @"desc":[self typeAllowText:[@"Location Services" dbph_LocalizedString]], @"icon":@"dbph_checkIcon" }]},
              
              @(DBPrivacyTypeHealth):@{ @"header":[self headerText:[@"Health" dbph_LocalizedString]],
                                        @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self typeTitle:[@"Health" dbph_LocalizedString]], @"icon":@"dbph_healthIcon" }, @{ @"desc":[self typeAllowText:[@"Health" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeHomeKit):@{ @"header":[self headerText:[@"HomeKit" dbph_LocalizedString]],
                                         @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self typeTitle:[@"HomeKit" dbph_LocalizedString]], @"icon":@"dbph_homekitIcon" }, @{ @"desc":[self typeAllowText:[@"HomeKit" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeMotionActivity):@{ @"header":[self headerText:[@"Motion Activity" dbph_LocalizedString]],
                                                @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self typeTitle:[@"Motion Activity" dbph_LocalizedString]], @"icon":@"dbph_motionIcon" }, @{ @"desc":[self typeAllowText:[@"Motion Activity" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeContacts):@{ @"header":[self headerText:[@"Contacts" dbph_LocalizedString]],
                                          @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self typeTitle:[@"Contacts" dbph_LocalizedString]], @"icon":@"dbph_contactsIcon" }, @{ @"desc":[self typeAllowText:[@"Contacts" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeNotifications):@{ @"header":[self headerText:[@"Notifications" dbph_LocalizedString]],
                                               @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[self typeTitle:[@"Notifications" dbph_LocalizedString]], @"icon":@"dbph_notificationsIcon" }, @{ @"desc":[self typeTitle:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"]], @"icon":self.appIcon ?: @"dbph_appIcon" }, @{ @"desc":[self typeAllowText:[@"Notifications" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }, @{ @"desc":[@"Select the alert style you prefer" dbph_LocalizedString], @"icon":@"dbph_alertIcon" }]},

              @(DBPrivacyTypeCalendars):@{ @"header":[self headerText:[@"Calendars" dbph_LocalizedString]],
                                           @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self typeTitle:[@"Calendars" dbph_LocalizedString]], @"icon":@"dbph_calendarsIcon" }, @{ @"desc":[self typeAllowText:[@"Calendars" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeReminders):@{ @"header":[self headerText:[@"Reminders" dbph_LocalizedString]],
                                           @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self typeTitle:[@"Reminders" dbph_LocalizedString]], @"icon":@"dbph_remindersIcon" }, @{ @"desc":[self typeAllowText:[@"Reminders" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeMicrophone):@{ @"header":[self headerText:[@"Microphone" dbph_LocalizedString]],
                                            @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self typeTitle:[@"Microphone" dbph_LocalizedString]], @"icon":@"dbph_microphoneIcon" }, @{ @"desc":[self typeAllowText:[@"Microphone" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeTwitter):@{ @"header":[self headerText:[@"Twitter" dbph_LocalizedString]],
                                         @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self typeTitle:[@"Twitter" dbph_LocalizedString]], @"icon":@"dbph_twitterIcon" }, @{ @"desc":[self typeAllowText:[@"Twitter" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeFacebook):@{ @"header":[self headerText:[@"Facebook" dbph_LocalizedString]],
                                          @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self typeTitle:[@"Facebook" dbph_LocalizedString]], @"icon":@"dbph_facebookIcon" }, @{ @"desc":[self typeAllowText:[@"Facebook" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }]} };
}

- (CGFloat) cellHeightForText:(NSString *)text {
    CGFloat width = CGRectGetWidth([[UIScreen mainScreen] bounds]) - 120.0;
    CGRect bounds = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin
                                    attributes:_cellAttributes context:NULL];
    
    CGFloat height = roundf(CGRectGetHeight(bounds) + 20.0);
    return ( height > 60.0 ) ? height + 10.0 : 60.0;
}

#pragma mark - UITableViewDataSource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.cellData[@(self.type)][@"steps"] count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DBPrivateHelperCell *cell = [tableView dequeueReusableCellWithIdentifier:[DBPrivateHelperCell identifier] forIndexPath:indexPath];
    [cell setIcon:self.cellData[@(self.type)][@"steps"][indexPath.row][@"icon"]
             text:self.cellData[@(self.type)][@"steps"][indexPath.row][@"desc"]
              row:indexPath.row + 1];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self cellHeightForText:self.cellData[@(_type)][@"steps"][indexPath.row][@"desc"]];
}

@end