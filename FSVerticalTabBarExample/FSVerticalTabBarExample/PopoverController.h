#import <UIKit/UIKit.h>

@protocol PopoverDelegate <NSObject>

-(void)hidePopover;

@end

@interface PopoverController : UIViewController

- (IBAction)closePopover:(id)sender;

@property (nonatomic, weak) id<PopoverDelegate>delegate;

@end
