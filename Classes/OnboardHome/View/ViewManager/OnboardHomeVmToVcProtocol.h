//  OnboardHomeVmToVcProtocol.h
//  OnboardHome

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "OnboardHomeViewManagerDelegate.h"


@protocol OnboardHomeVmToVcProtocol <NSObject>
- (void) setupView: (UIView *) view;
- (void) setViewManagerDelegate: (NSObject <OnboardHomeViewManagerDelegate> *) delegate;
@end
