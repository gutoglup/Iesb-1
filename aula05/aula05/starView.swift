//
//  starView.swift
//  aula05
//
//  Created by leonardo on 14/03/18.
//  Copyright © 2018 LS. All rights reserved.
//

import UIKit

@IBDesignable
class starView: UIView {
    
    // numero de pontos da estrela
    @IBInspectable
    var points: Int = 5
    // distrancia entre o centro
    @IBInspectable
    var distanceOfCenter: CGFloat = 3
    // largura da linha
    @IBInspectable
    var lineWidth: CGFloat = 3
    // cor do preenchimento
    @IBInspectable
    var fillColor: UIColor = UIColor.yellow
    // cor da linha
    @IBInspectable
    var strokeColor: UIColor = UIColor.blue
    
    override func draw(_ rect: CGRect){
        let path = UIBezierPath()
        
        var angle = -CGFloat(Float.pi / 2)
        let angleIncrement = CGFloat(Float.pi * 2 / Float(points))
        let radius = CGFloat(rect.width / 2)
        
        path.move(to: CGPoint(x: xPointOfCircle(radius, angle, 0, radius), y: yPointOfCircle(radius, angle, 0, radius)))
        for _ in 0 ..< points {
            addSequencePoints(path, angle, angleIncrement, rect, radius)
            angle += angleIncrement
        }
        
        path.close()
        path.lineWidth = lineWidth
        fillColor.setFill()
        strokeColor.setStroke()
        path.stroke()
        path.fill()
    }
    
    func addSequencePoints(_ path: UIBezierPath, _ angle: CGFloat, _ angleIncrement: CGFloat, _ rect: CGRect, _ radius: CGFloat) {
        let midAngleIncrement = angleIncrement / 2
        path.addLine(to: CGPoint(x: xPointOfCircle(distanceOfCenter, angle, midAngleIncrement, radius), y: yPointOfCircle(distanceOfCenter, angle, midAngleIncrement, radius)))
        path.addLine(to: CGPoint(x: xPointOfCircle( radius, angle, angleIncrement, radius), y: yPointOfCircle(radius, angle, angleIncrement, radius)))
    }
    
    func xPointOfCircle(_ distanceOfCenter: CGFloat, _ angle: CGFloat, _ angleIncrement: CGFloat, _ offsetCenter: CGFloat) -> CGFloat {
        return distanceOfCenter * cos(angle + angleIncrement) + offsetCenter
    }
    
    func yPointOfCircle(_ distanceOfCenter: CGFloat, _ angle: CGFloat, _ angleIncrement: CGFloat, _ offsetCenter: CGFloat) -> CGFloat {
        return distanceOfCenter * sin(angle + angleIncrement) + offsetCenter
    }
}
