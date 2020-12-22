//
//  CircleView.swift
//  TestTask
//
//  Created by Иван Викторович on 22.12.2020.
//

import UIKit

class CircleView: UIView {
    
    var backLayer: CAShapeLayer = CAShapeLayer()
    var frontLayer: CAShapeLayer = CAShapeLayer()
    
    @IBInspectable var trackWidth: CGFloat {
        get {
            return frontLayer.lineWidth
        }
        set {
            frontLayer.lineWidth = newValue
        }
    }

    override func draw(_ rect: CGRect) {
        let backPath = UIBezierPath(arcCenter: CGPoint(x: frame.width/2, y: frame.height/2), radius: frame.height/2, startAngle: -.pi/2, endAngle: 3 * .pi/2, clockwise: true)
        backLayer.path = backPath.cgPath
        backLayer.fillColor = UIColor.clear.cgColor
        backLayer.strokeColor = UIColor(red: 0.269, green: 0.278, blue: 0.362, alpha: 1).cgColor
        backLayer.lineWidth = 10
        layer.addSublayer(backLayer)
        
        let frontPath = UIBezierPath(arcCenter: CGPoint(x: frame.width/2, y: frame.height/2), radius: frame.height/2, startAngle: -.pi/2, endAngle: .pi / 2, clockwise: true)
        frontLayer.path = frontPath.cgPath
        frontLayer.fillColor = UIColor.clear.cgColor
        frontLayer.lineCap = .round
        frontLayer.strokeColor = UIColor(red: 0.122, green: 0.557, blue: 0.945, alpha: 1).cgColor
        layer.addSublayer(frontLayer)
        
    }


}
