
#import "CustomTabBar.h"

@implementation CustomTabBar
@synthesize delegate;
- (id)initWithFrame:(CGRect)frame
{
    if (self)
    {
        [self release];
        self = nil;
    }
    self = [[[[NSBundle mainBundle] loadNibNamed:@"CustomTabBar" owner:self options:nil] lastObject] retain];
    if (self)
    {
        self.backgroundColor = [UIColor lightGrayColor];
        
        self.frame = frame;
    }
    
    return self;
}

- (void)setButtonSelect:(NSInteger)index
{
    UIButton *btn = (UIButton *)[self viewWithTag:100 + index];
    [self tabBarTouchDown:btn];
}
- (IBAction)tabBarTouchDown:(UIButton *)sender
{

    UIButton *btn1 = (UIButton *)[self viewWithTag:100];
    UIButton *btn2 = (UIButton *)[self viewWithTag:101];
    UIButton *btn3 = (UIButton *)[self viewWithTag:102];
    UIButton *btn4 = (UIButton *)[self viewWithTag:103];

    NSArray *tmpArr = [NSArray arrayWithObjects:btn1,btn2,btn3,btn4, nil];
    for(UIButton *abtn in tmpArr)
    {
        if (abtn == sender)
        {
            if (abtn.isSelected)
            {
                return;
            }
            abtn.selected = YES;
        }
        else
        {
            abtn.selected = NO;
        }
    }
    
    
    NSInteger index = sender.tag - 100;

    if (delegate && [delegate respondsToSelector:@selector(touchDownAtIndex:)])
    {
        [delegate touchDownAtIndex:index];
    }
}
- (void)addViewCtl:(UIViewController *)viewCtl
{
    if (viewctls == nil)
    {
        viewctls = [[NSMutableArray arrayWithCapacity:0] retain];
    }
    [viewctls addObject:viewCtl];
}
- (void)replaceViewCtl:(UIViewController *)viewCtl atIndex:(NSInteger)index
{
    if ([viewctls count] > index)
    {
        [viewctls replaceObjectAtIndex:index withObject:viewCtl];
    }
}
- (UIViewController *)viewCtlAtIndex:(NSInteger)index
{
    if ([viewctls count] - 1 >= index)
    {
        return [viewctls objectAtIndex:index];
    }
    return nil;
}
- (void)dealloc
{
    [viewctls release];
    [super dealloc];
}
@end
