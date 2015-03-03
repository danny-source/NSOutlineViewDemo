//
//  AppDelegate.m
//  NSOutlineViewDemo
//
//  Created by danny on 2015/3/2.
//  Copyright (c) 2015年 danny. All rights reserved.
//

#import "AppDelegate.h"
#import "Staff.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSOutlineView *outlineV;

@end

@implementation AppDelegate
{
    NSMutableArray *company;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    company = [NSMutableArray array];
    Staff *dept1 = [Staff staffName:@"王董"];
    [dept1 addStaff:[Staff staffName:@"小王"]];
    [dept1 addStaff:[Staff staffName:@"楊吉"]];
    [company addObject:dept1];
    Staff *dept2 = [Staff staffName:@"張市"];
    [dept2 addStaff:[Staff staffName:@"林林"]];
    [dept2 addStaff:[Staff staffName:@"陳林"]];
    [company addObject:dept2];
    Staff *dept3 = [Staff staffName:@"枸本"];
    [company addObject:dept3];
    _outlineV.dataSource = self;
    _outlineV.delegate = self;
    
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item {
    if (!item) {
        return [company count];//無item內容為第一層，所以顯示第一層的Staff數量
    }
    return [(Staff*)item getStaffNumbers];//非第一層時會將目前這層的物件傳入，此時我們列出這層下的Staff數量
}
//顯示index陣列值中的內容
- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item {
    if (!item) {
        return [company objectAtIndex:index];//無item內容為第一層，所以顯示第一層的內容
    }
    return [[(Staff*)item getStaffs] objectAtIndex:index];//非第一層時會將目前這層的物件傳入，此時我們列出這層下是否有還有
}
//返回YES代表下層還有物件要列出
- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item {
    if (!item) {
        return NO;//無item內容時代表已經無下層物件
    }
    return [(Staff*)item isBoss];//非第一層時會將目前這層的物件傳入，此時我們列出這層下還有Staff時會將isBoss=YES
}

/* NOTE: this method is optional for the View Based OutlineView.
 */
- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(id)item {
    NSLog(@"%@",item);
    //提供Staff的名字
    return [(Staff*)item name];
}


@end
