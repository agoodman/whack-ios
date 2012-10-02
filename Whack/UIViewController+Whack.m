//
//  UIViewController+Whack.m
//  Whack
//
//  Created by Aubrey Goodman on 3/19/11.
//  Copyright 2012 Migrant Studios. All rights reserved.
//

#import "UIViewController+Whack.h"
#import "objc/runtime.h"


static void* kShakeTriggerBlockKey = @"WhackShakeTriggerKey";

@implementation UIViewController (Whack)

- (void)setShakeTriggerBlock:(dispatch_block_t)aShakeTriggerBlock
{
	objc_setAssociatedObject(self, kShakeTriggerBlockKey, aShakeTriggerBlock, OBJC_ASSOCIATION_COPY);
}

- (dispatch_block_t)shakeTriggerBlock
{
    return objc_getAssociatedObject(self, kShakeTriggerBlockKey);
}

- (void)registerShakeTrigger:(dispatch_block_t)aBlock
{
	self.shakeTriggerBlock = aBlock;
}

#pragma mark -

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

- (void)viewDidAppear:(BOOL)animated
{
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [self resignFirstResponder];
}

#pragma mark -

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent*)event
{
	dispatch_async(dispatch_get_main_queue(), self.shakeTriggerBlock);
}

@end
