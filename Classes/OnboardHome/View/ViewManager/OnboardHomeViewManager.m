//  OnboardHomeViewManager.m
//  OnboardHome

#import "OnboardHomeViewManager.h"
#import "OnboardHomeMainView.h"
#import "OnboardHomeMainViewOwner.h"


@interface OnboardHomeViewManager()


@end


@implementation OnboardHomeViewManager {
    __weak OnboardHomeViewController* viewController;
    OnboardHomeMainView* mainView;
    UIView* view;
}

@synthesize viewModel;
@synthesize viewManagerDelegate;


#pragma mark - Init and Dealloc
- (instancetype) initWithViewController: (OnboardHomeViewController *) vc {
    if (self = [super init]) {
        viewController = vc;
        OnboardHomeMainViewOwner* viewOwner = [[OnboardHomeMainViewOwner alloc] init];
        mainView = viewOwner.myView;
    }
    return self;
}

-(void) dealloc{
    
}

#pragma mark - setup
- (void) setupView: (UIView *) aView {
    view = aView;
    [view addSubview:mainView];
    mainView.frame = view.bounds;
    mainView.viewManager = self;
}


#pragma  mark - Logic Manager Delegate


@end
