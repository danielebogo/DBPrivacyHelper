//
//  DBPrivateHelperCell.m
//  DBPrivacyHelperExample
//
//  Created by iBo on 10/11/14.
//  Copyright (c) 2014 iBo. All rights reserved.
//

#import "DBPrivateHelperCell.h"

@interface DBPrivateHelperCell () {
    UIImageView *_iconView;
    UILabel *_cellLabel;
}
@end

@implementation DBPrivateHelperCell

+ (NSString *) identifier {
    return @"kDBPrivateHelperCellIdentifier";
}

- (instancetype) initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if ( self ) {
        self.backgroundColor = [UIColor clearColor];
        self.contentView.backgroundColor = self.backgroundColor;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.textLabel.font = [UIFont systemFontOfSize:10.0];
        self.textLabel.textColor = [UIColor colorWithWhite:1.0 alpha:.75];
        
        _iconView = [[UIImageView alloc] init];
        _iconView.translatesAutoresizingMaskIntoConstraints = NO;
        [self.contentView addSubview:_iconView];
        
        _cellLabel = [[UILabel alloc] init];
        _cellLabel.translatesAutoresizingMaskIntoConstraints = NO;
        _cellLabel.backgroundColor = [UIColor clearColor];
        _cellLabel.font = [UIFont boldSystemFontOfSize:12.0];
        _cellLabel.textColor = [UIColor whiteColor];
        _cellLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_cellLabel];
        
        NSDictionary *views = NSDictionaryOfVariableBindings(_iconView, _cellLabel);
        
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-40-[_iconView(30)]-20-[_cellLabel]-10-|"
                                                                                 options:0 metrics:nil views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_iconView(30)]"
                                                                                 options:0 metrics:nil views:views]];
        [self.contentView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|-0-[_cellLabel]-0-|"
                                                                                 options:0 metrics:nil views:views]];
        [self.contentView addConstraint:[NSLayoutConstraint constraintWithItem:_iconView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self.contentView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0.0]];
    }
    return self;
}

- (void) setIcon:(NSString *)icon text:(NSString *)text row:(NSInteger)row {
    _iconView.image = [UIImage imageNamed:icon];
    _cellLabel.text = text;
    self.textLabel.text = [NSString stringWithFormat:@".%li", (long)row];
}

@end