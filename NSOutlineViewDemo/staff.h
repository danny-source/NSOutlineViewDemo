//
//  Staff.h
//  NSOutlineViewDemo
//
//  Created by danny on 2015/3/3.
//  Copyright (c) 2015年 danny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Staff : NSObject

+ (id)staffName:(NSString*)name;
- (id)initWithName:(NSString*)name;
- (BOOL)isBoss;
- (NSString*)name;
- (void)addStaff:(Staff*)staff;
- (NSArray*) getStaffs;
- (NSInteger) getStaffNumbers;
@end
