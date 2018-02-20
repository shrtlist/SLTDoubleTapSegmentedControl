//
//  SLTViewController.swift
//  SLTDoubleTapSegmentedControl
//
//  Created by Marco Abundo on 3/11/14.
//  Copyright (c) 2018 shrtlist. All rights reserved.
//

import UIKit

class SLTViewController: UIViewController {

    @IBOutlet weak var doubleTapSegmentedControl: SLTDoubleTapSegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        doubleTapSegmentedControl.setTintColor(tintColor: .green, forSegmentAtIndex: 0)
        doubleTapSegmentedControl.setTintColor(tintColor: .red, forSegmentAtIndex: 1)
    }
}
