#import <UIKit/UIKBTree.h>
#import <UIKit/UIKBKeyView.h>

static BOOL canTransition(NSString *name, int fromState, int toState) {
    if ([name isEqualToString:@"International-Key"]) {
        if (fromState == 4 && toState == 16)
            return NO;
    }
    return YES;
}

%hook UIKBTree

- (BOOL)canFadeOutFromState:(int)fromState toState:(int)toState {
    return canTransition(self.name, fromState, toState);
}

%end

%hook UIKBKeyViewAnimator

- (BOOL)shouldTransitionKeyView:(UIKBKeyView *)view fromState:(int)fromState toState:(int)toState {
    return canTransition(view.key.name, fromState, toState);
}

- (void)_fadeOutKeyView:(UIKBKeyView *)view duration:(CGFloat)duration completion:(id)completion {
    %orig(view, duration == 0 ? 0.15 : duration, completion);
}

%end

%hook UIKBKeyViewAnimatorMonolith

- (BOOL)shouldTransitionKeyView:(UIKBKeyView *)view fromState:(int)fromState toState:(int)toState {
    return canTransition(view.key.name, fromState, toState);
}

%end
