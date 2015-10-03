//  OnboardHomeMainView.m
//  OnboardHome

#import "OnboardHomeMainView.h"
#import "OnboardHomeViewManager.h"

@interface OnboardHomeMainView()
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (strong, nonatomic) IBOutlet UIButton *enterButton;

@end

@implementation OnboardHomeMainView


@synthesize viewManager;
@synthesize viewModel;


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    return self;
}


- (void) awakeFromNib {
    [super awakeFromNib];
    UIImage* blurImage = [self blurWithCoreImage:self.backgroundImageView.image];
    [self.backgroundImageView setImage:blurImage];
 
    self.enterButton.layer.cornerRadius = 2.0;
    self.enterButton.layer.borderWidth = 1;
    self.enterButton.layer.borderColor = [UIColor whiteColor].CGColor;
    
}


- (UIImage *)blurWithCoreImage:(UIImage *)sourceImage
{
    CIImage *inputImage = [CIImage imageWithCGImage:sourceImage.CGImage];
    
    // Apply Affine-Clamp filter to stretch the image so that it does not
    // look shrunken when gaussian blur is applied
    CGAffineTransform transform = CGAffineTransformIdentity;
    CIFilter *clampFilter = [CIFilter filterWithName:@"CIAffineClamp"];
    [clampFilter setValue:inputImage forKey:@"inputImage"];
    [clampFilter setValue:[NSValue valueWithBytes:&transform objCType:@encode(CGAffineTransform)] forKey:@"inputTransform"];
    
    // Apply gaussian blur filter with radius of 30
    CIFilter *gaussianBlurFilter = [CIFilter filterWithName: @"CIGaussianBlur"];
    [gaussianBlurFilter setValue:clampFilter.outputImage forKey: @"inputImage"];
    [gaussianBlurFilter setValue:@5 forKey:@"inputRadius"];
    
    CIContext *context = [CIContext contextWithOptions:nil];
    CGImageRef cgImage = [context createCGImage:gaussianBlurFilter.outputImage fromRect:[inputImage extent]];
    
    // Set up output context.
    UIGraphicsBeginImageContext(self.backgroundImageView.frame.size);
    CGContextRef outputContext = UIGraphicsGetCurrentContext();
    
    // Invert image coordinates
    CGContextScaleCTM(outputContext, 1.0, -1.0);
    CGContextTranslateCTM(outputContext, 0, -self.backgroundImageView.frame.size.height);
    
    // Draw base image.
    CGContextDrawImage(outputContext, self.backgroundImageView.frame, cgImage);
    
    // Apply white tint
    CGContextSaveGState(outputContext);
    CGContextSetFillColorWithColor(outputContext, [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2].CGColor);
    CGContextFillRect(outputContext, self.backgroundImageView.frame);
    CGContextRestoreGState(outputContext);
    
    // Output image is ready.
    UIImage *outputImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return outputImage;
}
@end
