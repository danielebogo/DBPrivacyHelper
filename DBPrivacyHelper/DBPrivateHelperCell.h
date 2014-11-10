//
//  DBPrivateHelperCell.h
//  DBPrivacyHelperExample
//
//  Created by iBo on 10/11/14.
//  Copyright (c) 2014 iBo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DBPrivateHelperCell : UITableViewCell
/**
 *  Reuse Identifier for cell
 *
 *  @return An instance type of DBPrivateHelperCell
 */
+ (NSString *) identifier;

/**
 *  Set the cell values
 *
 *  @param icon The icon
 *  @param text The description text
 *  @param row  The row number
 */
- (void) setIcon:(NSString *)icon text:(NSString *)text row:(NSInteger)row;
@end