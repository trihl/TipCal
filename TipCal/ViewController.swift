//
//  ViewController.swift
//  TipCal
//
//  Created by Tri Ho on 8/12/15.
//  Copyright © 2015 Tri Ho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var totalTextField : UITextField!
    @IBOutlet var taxPctSlider : UISlider!
    @IBOutlet var taxPctLabel : UILabel!
    @IBOutlet var resultsTextView : UITextView!
    @IBOutlet var tipLabel : UILabel!
    @IBOutlet var tipControl: UISegmentedControl!
    
    let tipCalc = TipCalculatorModel(total: 33.25, taxPct: 0.06)
    
    func refreshUI() {
        totalTextField.text = String(format: "%0.2f", tipCalc.total)
        taxPctSlider.value = Float(tipCalc.taxPct) * 100.0
        taxPctLabel.text = "Tax Percentage (\(Int(taxPctSlider.value))%)\n"
        let totalTip = String(format: "%0.2f", tipCalc.subtotal)
        tipLabel.text = "Total for Tip: \(totalTip) $"
        resultsTextView.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        refreshUI()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func viewTapped(sender : AnyObject) {
        totalTextField.resignFirstResponder()
        tipCalc.total = (totalTextField.text! as NSString).doubleValue
        refreshUI()
    }
    
    @IBAction func taxPercentageChanged(sender : AnyObject) {
        tipCalc.taxPct = Double(taxPctSlider.value) / 100.0
        refreshUI()
    }
    
    @IBAction func calculateTapped(sender : AnyObject) {

        tipCalc.total = (totalTextField.text! as NSString).doubleValue
        refreshUI()

        // Set the tip from defaults
        let defaults = NSUserDefaults.standardUserDefaults()
        let tipOpt = defaults.integerForKey("defaultTipOption")
        
        var results = ""
       
        switch tipOpt
        {
        case 0:
        
            let tipValue = tipCalc.calcTipWithTipPct(0.15);
            let tipFinal = String(format: "%.2f", tipValue);
            results += "Tip 15%: \(tipFinal) $\n";
    
        case 1:
            
            let tipValue = tipCalc.calcTipWithTipPct(0.18)
            let tipFinal = String(format: "%.2f", tipValue)
            results += "Tip 18%: \(tipFinal) $\n";
        
        case 2:
            
            let tipValue = tipCalc.calcTipWithTipPct(0.22)
            let tipFinal = String(format: "%.2f", tipValue)
            results += "Tip 22%: \(tipFinal) $\n";
        
        default:
            
            let tipValue = tipCalc.calcTipWithTipPct(0.18)
            let tipFinal = String(format: "%.2f", tipValue)
            results += "Tip 18%: \(tipFinal) $\n";
        
        }

        resultsTextView.text = results
    }
}

