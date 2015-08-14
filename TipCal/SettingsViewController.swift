//
//  SettingsViewController.swift
//  TipCal
//
//  Created by Tri Ho on 8/14/15.
//  Copyright © 2015 Tri Ho. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet var defaultTipControl: UISegmentedControl!
    @IBAction func onBackPress(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        let defaults = NSUserDefaults.standardUserDefaults()
        var tipOpt = defaults.integerForKey("defaultTipOption")
        
        if tipOpt == NSNotFound {
            tipOpt = 1 // let's set it to the middle by default
        }
        
        defaultTipControl.selectedSegmentIndex = tipOpt
    }
    
    @IBAction func onTipChanged(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipControl.selectedSegmentIndex, forKey: "defaultTipOption")
        defaults.synchronize()
    }
}
