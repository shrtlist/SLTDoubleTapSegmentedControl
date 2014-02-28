## STLDoubleTapSegmentedControl

A double-tap segmented control. Each segment functions as a discrete double-tap button. Based on http://stackoverflow.com/questions/17652773/how-to-deselect-a-segment-in-segmented-control-button-permanently-till-its-click?lq=1

## Installation

- Add `STLDoubleTapSegmentedControl` and `STLDoubleTapSegmentedControl` to your project.
- `#import "STLDoubleTapSegmentedControl.h"` where you want to add the control.

## Usage

```  objective-c
STLDoubleTapSegmentedControl *radioSegmentedControl = [[STLDoubleTapSegmentedControl alloc] initWithItems:@[@"home", @"work", @"other"]];
[radioSegmentedControl addTarget:self action:@selector(segmentedControlChangedValue:) forControlEvents:UIControlEventValueChanged];
[self.view addSubview:radioSegmentedControl];
```

## License

STLDoubleTapSegmentedControl is licensed under the terms of the Apache 2.0 License. Please see the [LICENSE](LICENSE.md) file for full details.
