/*
 * Copyright 2018 shrtlist
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

import UIKit

public class SLTDoubleTapSegmentedControl: UISegmentedControl {

    // MARK: Public method

    public func setTintColor(tintColor: UIColor, forSegmentAtIndex index: Int) {
        guard let title = titleForSegment(at: index) else { return }

        let font = UIFont.systemFont(ofSize: 12)

        let attributes = [NSAttributedStringKey.font: font, NSAttributedStringKey.foregroundColor: tintColor]

        let attributedString = NSAttributedString(string: title, attributes: attributes)

        let image = imageFromAttributedString(text: attributedString)

        setImage(image, forSegmentAt: index)
    }

    // MARK: Private methods

    private func imageFromAttributedString(text: NSAttributedString) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(text.size(), false, 0.0)

        // draw in context
        text.draw(at: CGPoint(x: 0, y: 0))

        // transfer image
        guard let image = UIGraphicsGetImageFromCurrentImageContext()?.withRenderingMode(.alwaysOriginal) else {
            UIGraphicsEndImageContext()
            return nil
        }

        UIGraphicsEndImageContext()

        return image
    }

    // MARK: Custom touch handling

    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    let previousSelectedSegmentIndex = selectedSegmentIndex

        super.touchesBegan(touches, with: event)

        if previousSelectedSegmentIndex == selectedSegmentIndex {
            // Clear the segmented control
            selectedSegmentIndex = UISegmentedControlNoSegment

            // if the selectedSegmentIndex before the selection process is equal to the selectedSegmentIndex
            // after the selection process the superclass won't send a UIControlEventValueChanged event.
            // So we have to do this ourselves.
            sendActions(for: .valueChanged)
        }
    }
}
