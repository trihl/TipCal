//
//  TipCalModel.swift
//  TipCal
//
//  Created by Tri Ho on 8/12/15.
//  Copyright © 2015 Tri Ho. All rights reserved.
//

import Foundation

class TipCalculatorModel {
    var total: Double
    var taxPct: Double
    var subtotal: Double {
        get {
            return total / (taxPct + 1)
        }
    }
    
    init(total: Double, taxPct: Double) {
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTipPct(tipPct: Double) -> Double {
        return subtotal * tipPct
    }
    
    func returnPossibleTips() -> [Int: Double] {
        let possibleTipsInferred = [0.15, 0.18, 0.22]
        let possibleTipsExplicit: [Double] = [0.15, 0.18, 0.22]
        
        var retval = [Int: Double]()
        for possibleTip in possibleTipsExplicit {
            let intPct = Int(possibleTip*100)
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
    }
}