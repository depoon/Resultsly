//  OnboardHomeLmToVcProtocol.h
//  OnboardHome

#import <Foundation/Foundation.h>
#import "OnboardHomeLogicManagerDelegate.h"

@protocol OnboardHomeLmToVcProtocol <NSObject>
- (void) setLogicManagerDelegate: (NSObject <OnboardHomeLogicManagerDelegate> *) delegate;
@end
