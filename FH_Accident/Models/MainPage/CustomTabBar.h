
#import <UIKit/UIKit.h>

@protocol CustomTabBarDelegate <NSObject>

- (void)touchDownAtIndex:(NSInteger)index;

@end
@interface CustomTabBar : UIView
{
    id <CustomTabBarDelegate> delegate;
    NSMutableArray *viewctls;
}
@property (nonatomic, assign) id <CustomTabBarDelegate> delegate;

- (void)setButtonSelect:(NSInteger)index;
- (void)replaceViewCtl:(UIViewController *)viewCtl atIndex:(NSInteger)index;
- (void)addViewCtl:(UIViewController *)viewCtl;
- (UIViewController *)viewCtlAtIndex:(NSInteger)index;

@end
