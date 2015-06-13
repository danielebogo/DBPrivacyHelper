//
//  DBPrivacyHelperExampleTests.m
//  DBPrivacyHelperExampleTests
//
//  Created by iBo on 10/11/14.
//  Copyright (c) 2014 iBo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>

#import "UIViewController+DBPrivacyHelper.h"

@interface DBPrivacyHelperExampleTests : XCTestCase

@end

@implementation DBPrivacyHelperExampleTests {
    UIViewController *baseVc_;
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    baseVc_ = [[UIViewController alloc] init];
    baseVc_.view.backgroundColor = [UIColor redColor];
    
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:baseVc_];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSnapshot {
    // This is an example of a functional test case.
    UIImage *snapshot = [baseVc_ snapshot];
    
    XCTAssertTrue([snapshot isKindOfClass:[UIImage class]], @"Should be an image");
}

@end
