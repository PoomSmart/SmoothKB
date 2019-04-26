#import "../PS.h"

@interface UIKBTree : NSObject
- (NSString *)name;
@end

%hook UIKBTree

- (BOOL)canFadeOutFromState:(NSInteger)fromState toState:(NSInteger)toState
{
	if ([self.name isEqualToString:@"International-Key"]) {
		if (fromState == 4 && toState == 16)
			return NO;
	}
	return YES;
}

%end
