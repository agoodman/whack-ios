#import "UIViewController+Whack.h"

@synthesize shakeTriggerBlock = _shakeTriggerBlock;

- (void)registerShakeTrigger:(dispatch_block_t)aBlock
{
	self.shakeTriggerBlock = aBlock;
}

#pragma mark -

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent*)event
{
	dispatch_async(dispatch_get_main_queue(), self.shakeTriggerBlock);
}

