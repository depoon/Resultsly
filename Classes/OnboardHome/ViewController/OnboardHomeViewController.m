//  OnboardHomeViewControllerViewController.m
//  OnboardHomeViewController

#import "OnboardHomeViewController.h"
#import "OnboardHomeViewManager.h"
#import "OnboardHomeVmToVcProtocol.h"
#import "OnboardHomeLmToVcProtocol.h"
#import "OnboardHomeLogicManager.h"
#import "OnboardHomeViewManagerDelegate.h"
#import "OnboardHomeLogicManagerDelegate.h"

@interface OnboardHomeViewController ()
@property (nonatomic, strong) NSObject <OnboardHomeVmToVcProtocol, OnboardHomeLogicManagerDelegate> * viewManager;
@property (nonatomic, strong) NSObject <OnboardHomeLmToVcProtocol, OnboardHomeViewManagerDelegate> * logicManager;
@end


@implementation OnboardHomeViewController
@synthesize viewManager;
@synthesize logicManager;


#pragma mark - Init and Dealloc

- (instancetype)init{
    self = [super init];
    if (self) {
        
        self.viewManager = [[OnboardHomeViewManager alloc] initWithViewController:self];
        self.logicManager = [[OnboardHomeLogicManager alloc]init];
        [self.logicManager setLogicManagerDelegate: self.viewManager];
        [self.viewManager setViewManagerDelegate: self.logicManager];
    }
    return self;
}

-(void) dealloc{
    self.viewManager = nil;;
    self.logicManager = nil;
}


#pragma mark - ViewController life cycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.viewManager setupView: self.view];
}




@end
