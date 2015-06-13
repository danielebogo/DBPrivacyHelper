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

- (NSString *)dbph_LocalizedString {
    return DBPrivacyHelperLocalizableStrings(self);
}

@end



@implementation DBPrivacyHelperDataSource {
    NSDictionary *_cellAttributes;
}


#pragma mark - Life cycle

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        paragraphStyle.alignment = NSTextAlignmentLeft;
        
        _cellAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:12.0],
                            NSParagraphStyleAttributeName:paragraphStyle};
    }
    return self;
}


#pragma mark - Private methods

- (NSString *)dbph_headerText:(NSString *)string
{
    return [NSString stringWithFormat:[@"Allow access to \"%@\"\nwith these steps:" dbph_LocalizedString], string];
}

- (NSString *)dbph_typeTitle:(NSString *)string
{
    return [NSString stringWithFormat:[@"Tap on \"%@\"" dbph_LocalizedString], string];
}

- (NSString *)dbph_typeAllowText:(NSString *)string
{
    return [NSString stringWithFormat:[@"Allow your application to use \"%@\"" dbph_LocalizedString], string];
}

- (CGFloat)dbph_cellHeightForText:(NSString *)text
{
    CGFloat width = CGRectGetWidth([[UIScreen mainScreen] bounds]) - 120.0;
    CGRect bounds = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin
                                    attributes:_cellAttributes context:NULL];
    
    CGFloat height = roundf(CGRectGetHeight(bounds) + 20.0);
    return ( height > 60.0 ) ? height + 10.0 : 60.0;
}


#pragma mark - Override

- (NSDictionary *)cellData
{
    return @{ @(DBPrivacyTypePhoto):@{ @"header":[self dbph_headerText:[@"Photos" dbph_LocalizedString]],
                                       @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self dbph_typeTitle:[@"Photos" dbph_LocalizedString]], @"icon":@"dbph_photoIcon" }, @{ @"desc":[self dbph_typeAllowText:[@"Photos" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeCamera):@{ @"header":[self dbph_headerText:[@"Camera" dbph_LocalizedString]],
                                        @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self dbph_typeTitle:[@"Camera" dbph_LocalizedString]], @"icon":@"dbph_cameraIcon" }, @{ @"desc":[self dbph_typeAllowText:[@"Camera" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeLocation):@{ @"header":[self dbph_headerText:[@"Location Services" dbph_LocalizedString]],
                                          @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self dbph_typeTitle:[@"Location Services" dbph_LocalizedString]], @"icon":@"dbph_localizationIcon" }, @{ @"desc":[self dbph_typeAllowText:[@"Location Services" dbph_LocalizedString]], @"icon":@"dbph_checkIcon" }]},
              
              @(DBPrivacyTypeHealth):@{ @"header":[self dbph_headerText:[@"Health" dbph_LocalizedString]],
                                        @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self dbph_typeTitle:[@"Health" dbph_LocalizedString]], @"icon":@"dbph_healthIcon" }, @{ @"desc":[self dbph_typeAllowText:[@"Health" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeHomeKit):@{ @"header":[self dbph_headerText:[@"HomeKit" dbph_LocalizedString]],
                                         @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self dbph_typeTitle:[@"HomeKit" dbph_LocalizedString]], @"icon":@"dbph_homekitIcon" }, @{ @"desc":[self dbph_typeAllowText:[@"HomeKit" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeMotionActivity):@{ @"header":[self dbph_headerText:[@"Motion Activity" dbph_LocalizedString]],
                                                @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self dbph_typeTitle:[@"Motion Activity" dbph_LocalizedString]], @"icon":@"dbph_motionIcon" }, @{ @"desc":[self dbph_typeAllowText:[@"Motion Activity" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeContacts):@{ @"header":[self dbph_headerText:[@"Contacts" dbph_LocalizedString]],
                                          @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self dbph_typeTitle:[@"Contacts" dbph_LocalizedString]], @"icon":@"dbph_contactsIcon" }, @{ @"desc":[self dbph_typeAllowText:[@"Contacts" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeNotifications):@{ @"header":[self dbph_headerText:[@"Notifications" dbph_LocalizedString]],
                                               @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[self dbph_typeTitle:[@"Notifications" dbph_LocalizedString]], @"icon":@"dbph_notificationsIcon" }, @{ @"desc":[self dbph_typeTitle:[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"]], @"icon":self.appIcon ?: @"dbph_appIcon" }, @{ @"desc":[self dbph_typeAllowText:[@"Notifications" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }, @{ @"desc":[@"Select the alert style you prefer" dbph_LocalizedString], @"icon":@"dbph_alertIcon" }]},
              
              @(DBPrivacyTypeCalendars):@{ @"header":[self dbph_headerText:[@"Calendars" dbph_LocalizedString]],
                                           @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self dbph_typeTitle:[@"Calendars" dbph_LocalizedString]], @"icon":@"dbph_calendarsIcon" }, @{ @"desc":[self dbph_typeAllowText:[@"Calendars" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeReminders):@{ @"header":[self dbph_headerText:[@"Reminders" dbph_LocalizedString]],
                                           @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self dbph_typeTitle:[@"Reminders" dbph_LocalizedString]], @"icon":@"dbph_remindersIcon" }, @{ @"desc":[self dbph_typeAllowText:[@"Reminders" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeMicrophone):@{ @"header":[self dbph_headerText:[@"Microphone" dbph_LocalizedString]],
                                            @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self dbph_typeTitle:[@"Microphone" dbph_LocalizedString]], @"icon":@"dbph_microphoneIcon" }, @{ @"desc":[self dbph_typeAllowText:[@"Microphone" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeTwitter):@{ @"header":[self dbph_headerText:[@"Twitter" dbph_LocalizedString]],
                                         @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self dbph_typeTitle:[@"Twitter" dbph_LocalizedString]], @"icon":@"dbph_twitterIcon" }, @{ @"desc":[self dbph_typeAllowText:[@"Twitter" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }]},
              
              @(DBPrivacyTypeFacebook):@{ @"header":[self dbph_headerText:[@"Facebook" dbph_LocalizedString]],
                                          @"steps":@[ @{ @"desc":[@"Open device settings" dbph_LocalizedString], @"icon":@"dbph_settingsIcon" }, @{ @"desc":[@"Tap on Privacy" dbph_LocalizedString], @"icon":@"dbph_privacyIcon" }, @{ @"desc":[self dbph_typeTitle:[@"Facebook" dbph_LocalizedString]], @"icon":@"dbph_facebookIcon" }, @{ @"desc":[self dbph_typeAllowText:[@"Facebook" dbph_LocalizedString]], @"icon":@"dbph_switchIcon" }]} };
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cellData[@(self.type)][@"steps"] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    DBPrivateHelperCell *cell = [tableView dequeueReusableCellWithIdentifier:kDBPrivateHelperCellIdentifier forIndexPath:indexPath];
    [cell setIcon:self.cellData[@(self.type)][@"steps"][indexPath.row][@"icon"]
             text:self.cellData[@(self.type)][@"steps"][indexPath.row][@"desc"]
              row:indexPath.row + 1];
    return cell;
}


#pragma mark - UITableViewDelegate

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self dbph_cellHeightForText:self.cellData[@(_type)][@"steps"][indexPath.row][@"desc"]];
}

@end