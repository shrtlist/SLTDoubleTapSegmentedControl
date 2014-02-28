## SLTDoubleTapSegmentedControl

A double-tap segmented control. Each segment functions as a discrete double-tap button. Based on http://stackoverflow.com/questions/17652773/how-to-deselect-a-segment-in-segmented-control-button-permanently-till-its-click?lq=1

## Installation

- Add `SLTDoubleTapSegmentedControl.h` and `SLTDoubleTapSegmentedControl.m` to your project.
- `#import "SLTDoubleTapSegmentedControl.h"` where you want to add the control.

## Usage

```  objective-c
SLTDoubleTapSegmentedControl *doubleTapSegmentedControl = [[SLTDoubleTapSegmentedControl alloc] initWithItems:@[@"home", @"work", @"other"]];
[doubleTapSegmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
[self.view addSubview:doubleTapSegmentedControl];
```

## License

SLTDoubleTapSegmentedControl is licensed under the terms of the Apache 2.0 License. Please see the [LICENSE](LICENSE.md) file for full details.
