//
//  DBPrivacyHelperDataSource.h
//  DBPrivacyHelperExample
//
//  Created by iBo on 06/01/15.
//  Copyright (c) 2015 iBo. All rights reserved.
//

#import <Foundation/Foundation.h>

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
    DBPrivacyTypeNotifications
};

@interface NSString (DBPrivacyHelper)
- (NSString *) localizedString;
@end

@interface DBPrivacyHelperDataSource : NSObject

/**
 *  Personal App Icon name for DBPrivacyTypeNotifications
 */
@property (nonatomic, strong) NSString *appIcon;

/**
 *  DBPrivacyHelper data dictionary
 */
@property (nonatomic, readonly) NSDictionary *cellData;
@end