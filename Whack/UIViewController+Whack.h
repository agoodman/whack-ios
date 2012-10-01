@interface UIViewController (Whack)

@property (copy) dispatch_block_t shakeTriggerBlock;

-(void)registerShakeTrigger:(dispatch_block_t)aBlock;

@end

