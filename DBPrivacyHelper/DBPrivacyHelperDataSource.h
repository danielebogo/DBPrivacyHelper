//
//  DBPrivacyHelperDataSource.h
//  DBPrivacyHelperExample
//
//  Created by iBo on 06/01/15.
//  Copyright (c) 2015 iBo. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "DBPrivateHelperCell.h"

/**
 *  Privacy Types
 */
typedef NS_ENUM(NSUInteger, DBPrivacyType){
    /**
     *  Photos within camera roll
     */
    DBPrivacyTypePhoto,
    /**
     *  Use the Camera
     */
    DBPrivacyTypeCamera,
    /**
     *  Location Services
     */
    DBPrivacyTypeLocation,
    /**
     *  HealthKit
     */
    DBPrivacyTypeHealth,
    /**
     *  HomeKit
     */
    DBPrivacyTypeHomeKit,
    /**
     *  Motion Activity
     */
    DBPrivacyTypeMotionActivity,
    /**
     *  Access to Contacts
     */
    DBPrivacyTypeContacts,
    /**
     *  Push Notifications
     */
    DBPrivacyTypeNotifications,
    /**
     *  Reminders
     */
    DBPrivacyTypeReminders,
    /**
     *  Calendars
     */
    DBPrivacyTypeCalendars,
    /**
     *  Microphone
     */
    DBPrivacyTypeMicrophone,
    /**
     *  Twitter
     */
    DBPrivacyTypeTwitter,
    /**
     *  Facebook
     */
    DBPrivacyTypeFacebook
};

@interface NSString (DBPrivacyHelper)
- (NSString *) dbph_LocalizedString;
@end

@interface DBPrivacyHelperDataSource : NSObject <UITableViewDataSource, UITableViewDelegate>

/**
 *  Personal App Icon name for DBPrivacyTypeNotifications
 */
@property (nonatomic, strong) NSString *appIcon;

/**
 *  DBPrivacyHelper data dictionary
 */
@property (nonatomic, readonly) NSDictionary *cellData;

/**
 *  DBPrivacy type selected
 */
@property (nonatomic, assign) DBPrivacyType type;
@end