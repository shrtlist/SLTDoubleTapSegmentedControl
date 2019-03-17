/*
 * Copyright 2019 shrtlist
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *    http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "SLTDoubleTapSegmentedControl.h"

@implementation SLTDoubleTapSegmentedControl

#pragma mark - Designated initializers

- (instancetype)initWithItems:(NSArray *)items {
    if ((self = [super initWithItems:items])) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if ((self = [super initWithCoder:aDecoder]))
    {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if ((self = [super initWithFrame:frame]))
    {
        [self commonInit];
    }
    return self;
}

- (void)commonInit
{
    _font = [UIFont systemFontOfSize:18.0f];
}

#pragma mark - Public method

- (void)setTintColor:(UIColor *)tintColor forSegmentAtIndex:(NSUInteger)segment
{
    NSString *title = [self titleForSegmentAtIndex:segment];
    
    if (title)
    {
        NSDictionary *attributes = @{NSFontAttributeName:self.font,
                                     NSForegroundColorAttributeName:tintColor};
        
        NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:title attributes:attributes];
        
        UIImage *image = [self imageFromAttributedString:attributedString];
        
        [self setImage:image forSegmentAtIndex:segment];
    }
}

#pragma mark - Private methods

- (UIImage *)imageFromAttributedString:(NSAttributedString *)text
{
    UIGraphicsBeginImageContextWithOptions(text.size, NO, 0.0);
    
    // draw in context
    [text drawAtPoint:CGPointMake(0.0, 0.0)];
    
    // transfer image
    UIImage *image = [UIGraphicsGetImageFromCurrentImageContext() imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIGraphicsEndImageContext();
    
    return image;
}

+ (BOOL)isIOS7
{
    static BOOL isIOS7 = NO;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSInteger deviceSystemMajorVersion = [[[[[UIDevice currentDevice] systemVersion] componentsSeparatedByString:@"."] objectAtIndex:0] integerValue];
        if (deviceSystemMajorVersion >= 7) {
            isIOS7 = YES;
        }
        else {
            isIOS7 = NO;
        }
    });
    return isIOS7;
}

#pragma mark - Custom touch handling

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSInteger previousSelectedSegmentIndex = self.selectedSegmentIndex;
    
    [super touchesBegan:touches withEvent:event];
    
    if (![[self class] isIOS7])
    {
        // before iOS7 the segment is selected in touchesBegan
        if (previousSelectedSegmentIndex == self.selectedSegmentIndex)
        {
            // Clear the segmented control
            [self setSelectedSegmentIndex:UISegmentedControlNoSegment];

            // if the selectedSegmentIndex before the selection process is equal to the selectedSegmentIndex
            // after the selection process the superclass won't send a UIControlEventValueChanged event.
            // So we have to do this ourselves.
            [self sendActionsForControlEvents:UIControlEventValueChanged];
        }
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSInteger previousSelectedSegmentIndex = self.selectedSegmentIndex;
    
    [super touchesEnded:touches withEvent:event];
    
    if ([[self class] isIOS7])
    {
        // on iOS7 the segment is selected in touchesEnded
        if (previousSelectedSegmentIndex == self.selectedSegmentIndex)
        {
            // Clear the segmented control
            [self setSelectedSegmentIndex:UISegmentedControlNoSegment];

            // if the selectedSegmentIndex before the selection process is equal to the selectedSegmentIndex
            // after the selection process the superclass won't send a UIControlEventValueChanged event.
            // So we have to do this ourselves.
            [self sendActionsForControlEvents:UIControlEventValueChanged];
        }
    }
}

@end
