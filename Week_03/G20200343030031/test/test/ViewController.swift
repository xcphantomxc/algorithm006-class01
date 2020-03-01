//
//  ViewController.swift
//  test
//
//  Created by 薛忱 on 2020/2/13.
//  Copyright © 2020 薛忱. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var pointBx: Double = 0
    let touchButton: UIButton = UIButton()
    let touchButtonTwo: UIButton = UIButton()
    let touchButtonThree: UIButton = UIButton()
    let testView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        findContentChildren([1, 2], [1, 2, 3])
    }
    
    
    // 860. 柠檬水找零
    func lemonadeChange(_ bills: [Int]) -> Bool {
        
        var moneyArray: [Int : Int] = [5 : 0,
                                       10 : 0,
                                       20 : 0]
        
        for money in bills {
            
            switch money {
            case 5:
                moneyArray[5] = (moneyArray[5] ?? 0) + 1
                break
                
            case 10:
                if moneyArray[5] ?? 0 >= 1 {
                    moneyArray[5] = (moneyArray[5] ?? 0) - 1
                    moneyArray[10] = (moneyArray[10] ?? 0) + 1
                } else {
                    return false
                }
    
                break
                
            case 20:
                if moneyArray[10] ?? 0 >= 1 && moneyArray[5] ?? 0 >= 1 {
                    moneyArray[5] = (moneyArray[5] ?? 0) - 1
                    moneyArray[10] = (moneyArray[10] ?? 0) - 1
                } else if moneyArray[5] ?? 0 >= 3 {
                    moneyArray[5] = (moneyArray[5] ?? 0) - 3
                    
                } else {
                    return false
                }
                break
            default:
                break
            }
        }
        
        return true
    }
    
    
    //122. 买卖股票的最佳时机 II
    func maxProfit(_ prices: [Int]) -> Int {
        
        var result = 0
        
        for (index, item) in prices.enumerated().reversed() {
            
            if index >= 1 {
                if item > prices[index - 1] {
                    result = result + (item - prices[index - 1])
                }
            }
            
        }
        return result
    }
    
    //455. 分发饼干
    func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
        var haizi = g.sorted{ (s1, s2) -> Bool in
            return s1 < s2
        }
        
        let binggan = s.sorted{ (s1, s2) -> Bool in
            return s1 < s2
        }
        
        var result = 0
        for i in binggan {
            
            if haizi.count > 0 && i >= haizi[0] {
                result += 1
                haizi.remove(at: 0)
            }
            
        }
        
        return result
    }
}

