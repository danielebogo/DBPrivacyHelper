//
//  DBPrivacyHelperTests.m
//  DBPrivacyHelperExample
//
//  Created by Christian Klotz on 18/04/2015.
//  Copyright (c) 2015 iBo. All rights reserved.
//

#import "FBSnapshotTestCase.h"
#import "UIViewController+DBPrivacyHelper.h"

@interface DBPrivacyHelperTests : FBSnapshotTestCase

@end

@implementation DBPrivacyHelperTests

- (void)setUp {
    [super setUp];
    
    self.recordMode = NO; // Set to YES to create reference images
}

- (void)testDBPrivacyTypeCalendar {
    DBPrivateHelperController *controller = [DBPrivateHelperController helperForType:DBPrivacyTypeCalendars];
    [controller loadView];
    [controller viewDidLoad];
    
    FBSnapshotVerifyView(controller.view, nil);
}

- (void)testDBPrivacyTypeCamera {
    DBPrivateHelperController *controller = [DBPrivateHelperController helperForType:DBPrivacyTypeCamera];
    [controller loadView];
    [controller viewDidLoad];
    
    FBSnapshotVerifyView(controller.view, nil);
}

- (void)testDBPrivacyTypeContacts {
    DBPrivateHelperController *controller = [DBPrivateHelperController helperForType:DBPrivacyTypeContacts];
    [controller loadView];
    [controller viewDidLoad];
    
    FBSnapshotVerifyView(controller.view, nil);
}

- (void)testDBPrivacyTypeFacebook {
    DBPrivateHelperController *controller = [DBPrivateHelperController helperForType:DBPrivacyTypeFacebook];
    [controller loadView];
    [controller viewDidLoad];
    
    FBSnapshotVerifyView(controller.view, nil);
}

- (void)testDBPrivacyTypeHealth {
    DBPrivateHelperController *controller = [DBPrivateHelperController helperForType:DBPrivacyTypeHealth];
    [controller loadView];
    [controller viewDidLoad];
    
    FBSnapshotVerifyView(controller.view, nil);
}

- (void)testDBPrivacyTypeHomeKit {
    DBPrivateHelperController *controller = [DBPrivateHelperController helperForType:DBPrivacyTypeHomeKit];
    [controller loadView];
    [controller viewDidLoad];
    
    FBSnapshotVerifyView(controller.view, nil);
}

- (void)testDBPrivacyTypeLocation {
    DBPrivateHelperController *controller = [DBPrivateHelperController helperForType:DBPrivacyTypeLocation];
    [controller loadView];
    [controller viewDidLoad];
    
    FBSnapshotVerifyView(controller.view, nil);
}

- (void)testDBPrivacyTypeMicrophone {
    DBPrivateHelperController *controller = [DBPrivateHelperController helperForType:DBPrivacyTypeMicrophone];
    [controller loadView];
    [controller viewDidLoad];
    
    FBSnapshotVerifyView(controller.view, nil);
}

@end
