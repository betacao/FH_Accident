

#import "BusinessManager.h"

static BusinessManager *sharedBusinessManager = nil;
@implementation BusinessManager

+ (BusinessManager*)sharedManager
{
	if (!sharedBusinessManager)
    {
		@synchronized(self)
        {
			if (!sharedBusinessManager)
            {
				sharedBusinessManager = [[BusinessManager alloc] init];
			}
		}
	}
	return sharedBusinessManager;
}

- (void)dealloc
{
    self.themeMgr = nil;
    self.loginMgr = nil;
    [super dealloc];
}

- (id)init
{

    if (self= [super init])
    {
        self.themeMgr = [[[ThemeManager alloc] init] autorelease];
        self.loginMgr = [[[LoginManager alloc] init] autorelease];
    }
    return self;
}
@end
