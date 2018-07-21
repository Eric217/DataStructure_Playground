//
//  UIViewController+SplitController.m
//  DS_playgound
//
//  Created by Eric on 2018/7/21.
//  Copyright © 2018 SDU_iOS_LAB. All rights reserved.
//

#import "UIViewController+SplitController.h"

@implementation UIViewController (SplitController)

#define Delta 20

///真的ipad是正着还是横屏
- (bool)isDevicePortait {
    return ScreenW < ScreenH;
}

///对于ipad是指除了横屏2/3和大pro的半屏之外 所有宽小于高的情况，不是物理设备的portrait
- (bool)isPortrait {
    CGFloat sw = ScreenW, vw = self.view.bounds.size.width;
    bool heng2_3 = sw > ScreenH && (vw - sw/2) > Delta && sw > vw;
    if (heng2_3 || (IPADPro && [self isHalfIpad]))
        return 0;
    return vw < self.view.bounds.size.height;
}

- (bool)isFloatingOrThirth {
    if (IPHONE) {
        return [self isPortrait];
    } else {
        return (ScreenW/2 - self.view.bounds.size.width) > Delta;
    }
}

- (bool)isHalfIpad {
    if (IPHONE) {
        return 0;
    }
    return fabs(ScreenW/2 - self.view.bounds.size.width) < Delta;
}

- (bool)isTwoThirth {
    if (IPHONE) {
        return 0;
    }
    CGFloat sw = ScreenW, vw = self.view.bounds.size.width;
    return fabs(sw/2-vw) > Delta && sw > vw;
}

- (bool)isFullScreen {
    return ScreenW == self.view.bounds.size.width;
}

- (bool)canPullHideLeft {
    if (IPHONE)
        return 0;
    if ([self isPortrait])
        return [self isFullScreen];
    else {
        if (IPADPro) {
            return [self isHalfIpad];
        }
        return [self isTwoThirth];
        
    }
}

- (bool)canShowBoth {
    if (IPHONE)
        return IPHONE6P;
    return (![self isPortrait] && [self isFullScreen]) || (IPADPro && [self isTwoThirth]);
}

- (bool)isNoSplit {
    return ![self canShowBoth] && ![self canPullHideLeft];
}

- (ScreenMode)screenMode {
    //    if ([self isFloatingOrThirth]) {
    //        return ScreenModeFloatingOrThirth;
    //    } else if ([self isHalfIpad]) {
    //        return ScreenModeHalfIpad;
    //    } else if ([self canPullHideLeft]) {
    //        return ScreenModeCanPullHideLeft;
    //    } else if ([self canShowBoth]) {
    //        return ScreenModeCanShowBoth;
    //    }
    
    return 0;
}

- (void)automaticSplitStyle {
    [self.splitViewController setPreferredDisplayMode:UISplitViewControllerDisplayModeAutomatic];
}
- (void)overlaySplitStyle {
    [self.splitViewController setPreferredDisplayMode:UISplitViewControllerDisplayModePrimaryOverlay];
}
- (void)hidePrimarySplitStyle {
    [self.splitViewController setPreferredDisplayMode:UISplitViewControllerDisplayModePrimaryHidden];
}
@end
