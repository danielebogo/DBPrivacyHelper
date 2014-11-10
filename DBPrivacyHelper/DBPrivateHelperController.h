//
//  DBPrivateHelperController.h
//  DBPrivacyHelperExample
//
//  Created by iBo on 10/11/14.
//  Copyright (c) 2014 iBo. All rights reserved.
//

#define IS_IOS_8 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 ? 1 : 0)

@import UIKit;

typedef void (^DBPrivateHelperCompletionBlock)();

typedef NS_ENUM(NSUInteger, DBPrivacyType) {
    DBPrivacyTypePhoto,
    DBPrivacyTypeCamera,
    DBPrivacyTypeLocation
};

@interface DBPrivateHelperController : UIViewController
@property (nonatomic, assign) UIStatusBarStyle statusBarStyle;
@property (nonatomic, assign) BOOL canRotate;
@property (nonatomic, readonly) UIButton *closeButton;
@property (nonatomic, strong) UIImage *snapshot;
@property (nonatomic, copy) DBPrivateHelperCompletionBlock didDismissViewController;

+ (instancetype) helperForType:(DBPrivacyType)type;
@end