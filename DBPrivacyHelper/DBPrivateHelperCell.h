//
//  DBPrivateHelperCell.h
//  DBPrivacyHelperExample
//
//  Created by iBo on 10/11/14.
//  Copyright (c) 2014 iBo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBPrivateHelperCell : UITableViewCell
+ (NSString *) identifier;
- (void) setIcon:(NSString *)icon text:(NSString *)text row:(NSInteger)row;
@end