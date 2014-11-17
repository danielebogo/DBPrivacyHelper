//
//  DBPrivateHelperController.m
//  DBPrivacyHelperExample
//
//  Created by iBo on 10/11/14.
//  Copyright (c) 2014 iBo. All rights reserved.
//

#import "DBPrivateHelperController.h"
#import "DBPrivateHelperCell.h"
#import "UIImage+ImageEffects.h"

#ifndef DBPrivacyHelperLocalizableStrings
#define DBPrivacyHelperLocalizableStrings(key) \
NSLocalizedStringFromTable(key, @"DBPrivacyHelperLocalizable", nil)
#endif

@interface DBPrivateHelperController () <UITableViewDataSource, UITableViewDelegate> {
    DBPrivacyType _type;
    UIImageView *_backgroundImage;
    UITableView *_tableView;
    NSDictionary *_typeNames, *_cellAttributes;
    NSArray *_cellData;
}
@end

@implementation DBPrivateHelperController

+ (instancetype) helperForType:(DBPrivacyType)type {
    return [[[self class] alloc] initWithPrivacyType:type];
}

- (id) initWithPrivacyType:(DBPrivacyType)type {
    self = [super init];
    if ( self ) {
        _type = type;
        _canRotate = NO;
        _statusBarStyle = UIStatusBarStyleLightContent;
        
        _typeNames = @{ @(DBPrivacyTypePhoto):@{ @"title":DBPrivacyHelperLocalizableStrings(@"Photos"), @"icon":@"dbph_photoIcon" },
                        @(DBPrivacyTypeCamera):@{ @"title":DBPrivacyHelperLocalizableStrings(@"Camera"), @"icon":@"dbph_cameraIcon" },
                        @(DBPrivacyTypeLocation):@{ @"title":DBPrivacyHelperLocalizableStrings(@"Location Services"), @"icon":@"dbph_localizationIcon" },
                        @(DBPrivacyTypeHealth):@{ @"title":DBPrivacyHelperLocalizableStrings(@"Health"), @"icon":@"dbph_healthIcon" },
                        @(DBPrivacyTypeHomeKit):@{ @"title":DBPrivacyHelperLocalizableStrings(@"HomeKit"), @"icon":@"dbph_homekitIcon" },
                        @(DBPrivacyTypeMotionActivity):@{ @"title":DBPrivacyHelperLocalizableStrings(@"Motion Activity"), @"icon":@"dbph_motionIcon" }};
        
        NSString *titleText = DBPrivacyHelperLocalizableStrings(@"Tap on \"%@\"");
        NSString *allowText = DBPrivacyHelperLocalizableStrings(@"Allow your application to use \"%@\"");
        NSString *allowIcon = (_type == DBPrivacyTypeLocation) ? @"dbph_checkIcon" : @"dbph_switchIcon";
        _cellData = @[ @{ @"desc":DBPrivacyHelperLocalizableStrings(@"Open device settings"), @"icon":@"dbph_settingsIcon" },
                       @{ @"desc":DBPrivacyHelperLocalizableStrings(@"Tap on Privacy"), @"icon":@"dbph_privacyIcon" },
                       @{ @"desc":[NSString stringWithFormat:titleText, _typeNames[@(_type)][@"title"]], @"icon":_typeNames[@(_type)][@"icon"] },
                       @{ @"desc":[NSString stringWithFormat:allowText, _typeNames[@(_type)][@"title"]], @"icon":allowIcon }];
        
        NSMutableParagraphStyle *paragraphStyle = [NSMutableParagraphStyle new];
        paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
        paragraphStyle.alignment = NSTextAlignmentLeft;
        
        _cellAttributes = @{ NSFontAttributeName:[UIFont boldSystemFontOfSize:12.0], NSParagraphStyleAttributeName:paragraphStyle };
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    _backgroundImage = [[UIImageView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    _backgroundImage.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:_backgroundImage];
    
    if ( IS_IOS_8 ) {
        _backgroundImage.image = self.snapshot;
        
        UIBlurEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
        UIVisualEffectView *blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
        blurEffectView.frame = _backgroundImage.bounds;
        blurEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
//        [_backgroundImage addSubview:blurEffectView];
        
        UIVibrancyEffect *vibrancyEffect = [UIVibrancyEffect effectForBlurEffect:blurEffect];
        UIVisualEffectView *vibrancyEffectView = [[UIVisualEffectView alloc] initWithEffect:vibrancyEffect];
        vibrancyEffectView.frame = _backgroundImage.bounds;
        vibrancyEffectView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        [blurEffectView.contentView addSubview:vibrancyEffectView];
        [_backgroundImage addSubview:blurEffectView];
    } else {
        _backgroundImage.image = [self.snapshot applyDarkEffect];
    }
    
    NSString *titleText = DBPrivacyHelperLocalizableStrings(@"Allow access to \"%@\"\nwith these steps:");
    
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:(CGRect){ 0, 0, CGRectGetWidth([[UIScreen mainScreen] bounds]), 80 }];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:14.0];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    titleLabel.text = [NSString stringWithFormat:titleText, _typeNames[@(_type)][@"title"]];
    titleLabel.numberOfLines = 2;

    _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    [_tableView registerClass:[DBPrivateHelperCell class] forCellReuseIdentifier:[DBPrivateHelperCell identifier]];
    _tableView.translatesAutoresizingMaskIntoConstraints = NO;
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.backgroundView = nil;
    _tableView.separatorColor = [UIColor clearColor];
    _tableView.tableHeaderView = titleLabel;
    _tableView.dataSource = self;
    _tableView.delegate = self;
    _tableView.scrollEnabled = NO;
    [self.view addSubview:_tableView];
    
    _closeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    _closeButton.translatesAutoresizingMaskIntoConstraints = NO;
    _closeButton.titleLabel.font = [UIFont boldSystemFontOfSize:12.0];
    _closeButton.backgroundColor = [UIColor clearColor];
    [_closeButton setTitle:DBPrivacyHelperLocalizableStrings(@"Close").uppercaseString forState:UIControlStateNormal];
    [_closeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_closeButton addTarget:self action:@selector(dismissHelper:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_closeButton];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_tableView, _closeButton);
    
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[_closeButton]-20-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-0-[_tableView]-0-|" options:0 metrics:nil views:views]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[_closeButton(30)]-0-[_tableView]-0-|" options:0 metrics:nil views:views]];
}

- (void) dismissHelper:(UIButton *)button {
    [self dismissViewControllerAnimated:YES completion:self.didDismissViewController];
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self setNeedsStatusBarAppearanceUpdate];
}

- (void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    self.snapshot = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat) cellHeightForText:(NSString *)text {
    CGFloat width = CGRectGetWidth(_tableView.frame) - 120.0;
    CGRect bounds = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin
                                    attributes:_cellAttributes context:NULL];
    
    CGFloat height = roundf(CGRectGetHeight(bounds) + 20);
    return ( height > 60.0 ) ? height + 10 : 60.0;
}

#pragma mark - UITableViewDataSource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cellData.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    DBPrivateHelperCell *cell = [tableView dequeueReusableCellWithIdentifier:[DBPrivateHelperCell identifier]];
    [cell setIcon:_cellData[indexPath.row][@"icon"] text:_cellData[indexPath.row][@"desc"] row:indexPath.row + 1];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [self cellHeightForText:_cellData[indexPath.row][@"desc"]];
}

#pragma mark - Status Bar Style

- (UIStatusBarStyle) preferredStatusBarStyle {
    return self.statusBarStyle;
}

#pragma mark - ViewController Rotation

- (BOOL) shouldAutorotate {
    return self.canRotate;
}

- (NSUInteger) supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskAll;
}

@end