//
//  DBPrivacyHelperControllerTests.m
//  DBPrivacyHelperExample
//
//  Created by Christian Klotz on 18/04/2015.
//  Copyright (c) 2015 iBo. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <OCMock/OCMock.h>
#import "UIViewController+DBPrivacyHelper.h"

@interface DBPrivateHelperControllerTests : XCTestCase

@property (nonatomic, strong) UIViewController *controller;

@end

@implementation DBPrivateHelperControllerTests

- (void)setUp {
    [super setUp];
    
    self.controller = [[UIViewController alloc] init];
}

- (void)tearDown {
    [super tearDown];
}


- (void)testTapCloseButtonDismissesController {
    DBPrivateHelperController *controller = [DBPrivateHelperController helperForType:DBPrivacyTypeCalendars];
    [controller loadView];
    [controller viewDidLoad];
    
    OCMockObject *mock = [OCMockObject partialMockForObject:controller];
    [[mock expect] didDismissViewController];
    
    [controller.closeButton sendActionsForControlEvents:UIControlEventTouchUpInside];
    
    [mock verify];
}


@end
