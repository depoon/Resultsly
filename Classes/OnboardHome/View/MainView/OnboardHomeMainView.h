//  OnboardHomeMainView.h
//  OnboardHome

#import <UIKit/UIKit.h>
#import "OnboardHomeViewModel.h"


@class OnboardHomeViewManager;


@interface OnboardHomeMainView : UIView
@property (strong, nonatomic) OnboardHomeViewModel* viewModel;
@property (weak, nonatomic) OnboardHomeViewManager* viewManager;
@end
