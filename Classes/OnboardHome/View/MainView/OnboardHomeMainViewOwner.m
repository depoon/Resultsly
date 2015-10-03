//  OnboardHomeMainViewOwner.m
//  OnboardHome


#import "OnboardHomeMainViewOwner.h"

@implementation OnboardHomeMainViewOwner

- (instancetype) init {
    self = [super init];
    [[NSBundle mainBundle] loadNibNamed:@"OnboardHomeMainView" owner:self options:nil];
    return self;
}

@end
