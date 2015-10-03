//  OnboardHomeLogicManager.h
//  OnboardHome

#import <Foundation/Foundation.h>
#import "OnboardHomeLogicManagerDelegate.h"
#import "OnboardHomeViewManagerDelegate.h"
#import "OnboardHomeViewModel.h"
#import "OnboardHomeLmToVcProtocol.h"


@interface OnboardHomeLogicManager : NSObject<OnboardHomeViewManagerDelegate, OnboardHomeLmToVcProtocol>
@property (nonatomic, weak) NSObject <OnboardHomeLogicManagerDelegate>* logicManagerDelegate;
@end
