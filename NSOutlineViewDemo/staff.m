//
//  Staff.m
//  NSOutlineViewDemo
//
//  Created by danny on 2015/3/3.
//  Copyright (c) 2015年 danny. All rights reserved.
//

#import "Staff.h"

@implementation Staff
{
    NSMutableArray *_staffInStaff;
    NSString *_name;
}

- (id)init {
    return [self initWithName:@"name"];
}

+ (id)staffName:(NSString*)name {
    return [[Staff alloc] initWithName:name];
}

//設定員工名字
- (id)initWithName:(NSString*)name {
    self = [super init];
    if (self) {
        // Initialize self.
        _staffInStaff = [NSMutableArray array];
        _name = [name copy];
    }
    return self;
}


- (NSString*)name {
    return _name;
}

//是否為老闆，此員工下還有掛員工即為老闆
- (BOOL)isBoss {
    return (_staffInStaff.count>0?YES:NO);
}

- (void)addStaff:(Staff*)staff {
    [_staffInStaff addObject:staff];
}

- (NSInteger)getStaffNumbers {
    return [_staffInStaff count];
}

- (NSArray*)getStaffs {
    return [_staffInStaff copy];
}

- (NSString*)description {
    return _name;
}

@end
