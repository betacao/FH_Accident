
#import <Foundation/Foundation.h>
#import "ThemeManager.h"
#import "LoginManager.h"

@interface BusinessManager : NSObject{
}
@property (nonatomic,retain) ThemeManager *themeMgr;
@property (nonatomic, retain) LoginManager *loginMgr;
+ (BusinessManager*)sharedManager;
@end
