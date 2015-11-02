/*
 * Copyright 2014 shrtlist
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

// Double-tap segmented control. Each segment functions as a discrete double-tap button.
// Credit: http://stackoverflow.com/questions/17652773/how-to-deselect-a-segment-in-segmented-control-button-permanently-till-its-click?lq=1

@import UIKit;

@interface SLTDoubleTapSegmentedControl : UISegmentedControl

- (void)setTintColor:(UIColor *)tintColor forSegmentAtIndex:(NSUInteger)segment;

@end
