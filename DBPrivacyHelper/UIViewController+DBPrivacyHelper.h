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
- (void) showPrivacyHelperForType:(DBPrivacyType)type;
- (void) showPrivacyHelperForType:(DBPrivacyType)type controller:(void(^)(DBPrivateHelperController *vc))controllerBlock
                       didPresent:(DBPrivateHelperCompletionBlock)didPresent
                       didDismiss:(DBPrivateHelperCompletionBlock)didDismiss
            useDefaultSettingPane:(BOOL)defaultSettingPane;
@end