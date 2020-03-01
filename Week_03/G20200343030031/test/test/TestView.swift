//
//  TestView.swift
//  test
//
//  Created by 薛忱 on 2020/2/13.
//  Copyright © 2020 薛忱. All rights reserved.
//

import UIKit

class TestView: UIView {
    
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath.init()
        
        path.move(to: CGPoint(x: 30, y: 30))
        path.addLine(to: CGPoint(x: 100, y: 100))
        path.lineWidth = 1
        
        
        let color = UIColor.red
        color.set()
        
        path.stroke()
        
        UIView.animate(withDuration: 2, animations: {
            
        }) { (scuess) in
            path.removeAllPoints()
            self.setNeedsDisplay()
        }
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
