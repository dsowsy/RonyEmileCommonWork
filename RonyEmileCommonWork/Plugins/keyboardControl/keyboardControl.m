//
//  SMS Composer plugin for PhoneGap
//

#import "keyboardControl.h"


@implementation keyboardControl
@synthesize arguments;

- (void)hide:(NSMutableArray*)arguments withDict: (NSMutableDictionary*)options
{
    [self.webView endEditing:YES];
}  

- (void)show:(NSMutableArray*)theArguments withDict:(NSMutableDictionary*)options 
{
    UITextView* toRemoveTextView = (UITextView*) [self.webView viewWithTag:69];
    
    [toRemoveTextView removeFromSuperview];
    
    self.arguments = theArguments;
    
    
    UITextView *hiddenTextView = [[UITextView alloc] initWithFrame:CGRectMake(-100.0, -100.0, 0.0, 0.0)];
    
    hiddenTextView.autocorrectionType = UITextAutocorrectionTypeNo;
    hiddenTextView.autocapitalizationType= UITextAutocapitalizationTypeNone;
    
    hiddenTextView.tag = 69;
    hiddenTextView.delegate = self;
    
    NSLog(@"show ios IOS keyboard for field id :  %@" , arguments);
    NSInteger keyboardType = [[self->arguments objectAtIndex:2] intValue];
    hiddenTextView.keyboardType = keyboardType;
    NSInteger returnKeyType = [[arguments objectAtIndex:3] intValue];
    hiddenTextView.returnKeyType = returnKeyType;
    
    hiddenTextView.text = [self->arguments objectAtIndex:4];
    
   
    
    [self.webView addSubview:hiddenTextView];
    [hiddenTextView becomeFirstResponder];
    [hiddenTextView release];
}

- (void)textViewDidChange:(UITextView *)textView
{
    NSDictionary* callBackDict = [NSDictionary dictionaryWithObjectsAndKeys:self.arguments, @"arguments", textView.text, @"text", nil];
    NSString* callBackDictJSON = [callBackDict JSONRepresentation];
    NSString* jsCallback = [NSString stringWithFormat:@"window.plugins.keyboardControl.callBack('%@')", [callBackDictJSON description]];
    
    //NSLog(@"%@", jsCallback);
    
    [self writeJavascript:jsCallback];
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView
{
    switch (textView.returnKeyType) {
        case UIReturnKeyDefault:
            NSLog(@"@UIReturnKeyDefault");
            break;
        case UIReturnKeyGo:
            NSLog(@"UIReturnKeyGo");
            break;
        case UIReturnKeyNext:
            NSLog(@"UIReturnKeyNext");
            break;
        case UIReturnKeyDone:
             NSLog(@"UIReturnKeyDone");
            break;
        default:
             NSLog(@"None");
            break;
    }
    return YES;
}
@end