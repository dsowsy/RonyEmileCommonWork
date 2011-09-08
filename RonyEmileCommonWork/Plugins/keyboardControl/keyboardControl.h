//
//  keyboardControl.h
//


#import <Foundation/Foundation.h>
#ifdef PHONEGAP_FRAMEWORK
#import <PhoneGap/PGPlugin.h>
#else
#import "PGPlugin.h"
#endif

@interface keyboardControl : PGPlugin <UITextViewDelegate> {
}

- (void)show:(NSArray*)arguments withDict:(NSDictionary*)options;
- (void)hide:(NSArray*)arguments withDict:(NSDictionary*)options;
@property(copy, nonatomic) NSMutableArray* arguments;
@end
