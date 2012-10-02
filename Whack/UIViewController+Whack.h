//
//  UIViewController+Whack.h
//  Whack
//
//  Created by Aubrey Goodman on 3/19/11.
//  Copyright 2012 Migrant Studios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface UIViewController (Whack)

@property (copy) dispatch_block_t shakeTriggerBlock;

-(void)registerShakeTrigger:(dispatch_block_t)aBlock;

@end

