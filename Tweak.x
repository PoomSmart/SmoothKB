#import <UIKit/UIKBTree.h>

%hook UIKBTree

- (BOOL)canFadeOutFromState:(int)fromState toState:(int)toState {
    if ([self.name isEqualToString:@"International-Key"]) {
        if (fromState == 4 && toState == 16)
            return NO;
    }
    return YES;
}

%end

%hook UIKBKeyViewAnimator

- (void)_fadeOutKeyView:(id)view duration:(CGFloat)duration completion:(id)completion {
    %orig(view, duration == 0 ? 0.15 : duration, completion);
}

%end

%hook UIKBKeyViewAnimatorMonolith

- (BOOL)shouldTransitionKeyView:(id)view fromState:(int)fromState toState:(int)toState {
    return YES;
}

%end
