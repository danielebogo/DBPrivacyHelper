//
//  DBPrivateHelperCell.h
//  DBPrivacyHelperExample
//
//  Created by iBo on 10/11/14.
//  Copyright (c) 2014 iBo. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString *const kDBPrivateHelperCellIdentifier;


@interface DBPrivateHelperCell : UITableViewCell
/**
 *  Set the cell values
 *
 *  @param icon The icon
 *  @param text The description text
 *  @param row  The row number
 */
- (void)setIcon:(NSString *)icon text:(NSString *)text row:(NSInteger)row;
@end