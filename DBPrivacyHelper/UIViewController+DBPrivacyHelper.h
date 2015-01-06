//
//  UIViewController+DBPrivacyHelper.h
//  DBPrivacyHelperExample
//
//  Created by iBo on 10/11/14.
//  Copyright (c) 2014 iBo. All rights reserved.
//

@import UIKit;
@import Foundation;

#import "DBPrivateHelperController.h"

@interface UIViewController (DBPrivacyHelper)
/**
 *  Personal App Icon name for DBPrivacyTypeNotifications
 */
@property (nonatomic, strong) NSString *appIcon;

/**
 *  Show the privacy helper
 *
 *  @param type The type of privacy
 */
- (void) showPrivacyHelperForType:(DBPrivacyType)type;

/**
 *  Show the privacy helper with customization data
 *
 *  @param type               The type of privacy
 *  @param controllerBlock    Customize the DBPrivateHelperController view controller
 *  @param didPresent         Customize the completion block of presentViewController:animated:completion:
 *  @param didDismiss         Customize the completion block of dismissViewControllerAnimated:completion:
 *  @param defaultSettingPane If NO force to use DBPrivateHelperController instead of the default settings pane on iOS 8. Only for iOS 8. Default value is YES.
 */
- (void) showPrivacyHelperForType:(DBPrivacyType)type controller:(void(^)(DBPrivateHelperController *vc))controllerBlock
                       didPresent:(DBPrivateHelperCompletionBlock)didPresent
                       didDismiss:(DBPrivateHelperCompletionBlock)didDismiss
            useDefaultSettingPane:(BOOL)defaultSettingPane;
/**
 *  Snapshot of your Window
 *
 *  @return An UIImage of your Window
 */
- (UIImage *) snapshot;
@end