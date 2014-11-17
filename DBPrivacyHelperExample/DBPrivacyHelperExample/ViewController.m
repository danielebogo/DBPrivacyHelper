//
//  ViewController.m
//  DBPrivacyHelperExample
//
//  Created by iBo on 10/11/14.
//  Copyright (c) 2014 iBo. All rights reserved.
//

#import "ViewController.h"
#import "UIViewController+DBPrivacyHelper.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImageView *bg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.jpg"]];
    bg.translatesAutoresizingMaskIntoConstraints = NO;
    bg.contentMode = UIViewContentModeScaleAspectFill;
    bg.clipsToBounds = YES;
    [self.view addSubview:bg];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    button.backgroundColor = [UIColor colorWithWhite:0 alpha:.85];
    [button setTitle:@"Open" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(openHelper) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(bg, button);
    NSDictionary *metrics = @{ @"buttonW":@100, @"buttonH":@50 };
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[bg]-0-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[bg]-0-|" options:0 metrics:nil views:views]];
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[button(buttonW)]" options:0
                                                                      metrics:metrics views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[button(buttonH)]" options:0
                                                                      metrics:metrics views:views]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0.0]];
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:button attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.view attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) openHelper {
    [self showPrivacyHelperForType:DBPrivacyTypeLocation];
//    [self openHelperToCustomize];
}

- (void) openHelperToCustomize {
    [self showPrivacyHelperForType:DBPrivacyTypeLocation controller:^(DBPrivateHelperController *vc) {
        //customize the view controller to present
    } didPresent:^{
        //customize the completion block of presentViewController:animated:completion:
    } didDismiss:^{
        //customize the completion block of dismissViewControllerAnimated:completion:
    } useDefaultSettingPane:YES]; //If NO force to use DBPrivateHelperController instead of the default settings pane on iOS 8. Only for iOS 8. Default value is YES.
}

@end