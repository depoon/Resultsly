//  OnboardHomeViewManager.h
//  OnboardHome

#import <Foundation/Foundation.h>
#import "OnboardHomeVmToVcProtocol.h"
#import "OnboardHomeViewController.h"
#import "OnboardHomeViewModel.h"
#import "OnboardHomeLogicManagerDelegate.h"
#import "OnboardHomeViewManagerDelegate.h"


@interface OnboardHomeViewManager : NSObject <OnboardHomeVmToVcProtocol, OnboardHomeLogicManagerDelegate>
@property (nonatomic, strong) OnboardHomeViewModel* viewModel;
@property (nonatomic, weak) NSObject<OnboardHomeViewManagerDelegate>* viewManagerDelegate;

- (instancetype) initWithViewController: (OnboardHomeViewController *) vc;
@end
