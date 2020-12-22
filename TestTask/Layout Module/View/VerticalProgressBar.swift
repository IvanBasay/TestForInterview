//
//  VerticalProgressBar.swift
//  TestTask
//
//  Created by Иван Викторович on 22.12.2020.
//

import UIKit

@IBDesignable
class VerticalProgressBar: UIProgressView {
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.transform = CGAffineTransform(rotationAngle: -90 * (.pi/180))
        
    }
}
