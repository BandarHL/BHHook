#import <UIKit/UIKit.h>
#import <SwiftHooker-Swift.h>

@interface _TtC12SwiftExample9UserModel : NSObject
@end

@interface SWTestViewController : UIViewController
@property (nonatomic, strong) _TtC12SwiftExample9UserModel *model;
@end

%hook SWTestViewController
- (void)getUserHandler:(UIButton *)sender {
    BHHook *hookEngine = [[BHHook alloc] initWithInstance:self.model _class:[self.model classForCoder]];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if ([defaults boolForKey:@"hook"]) {
        // Get the orignal values
        NSString *UsernameOrigValue = [hookEngine getValueWithProperty:@"Username"];
        NSString *EmailOrigValue = [hookEngine getValueWithProperty:@"email"];
        
        // Set new value
        [hookEngine hookWithProperty:@"Username" value:[NSString stringWithFormat:@"%@ - Hooked", UsernameOrigValue]];
        [hookEngine hookWithProperty:@"email" value:[NSString stringWithFormat:@"%@ - Hooked", EmailOrigValue]];
    }
    
    %orig;
}
%end
