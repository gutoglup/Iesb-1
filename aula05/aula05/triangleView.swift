//
//  triangleView.swift
//  aula05
//
//  Created by leonardo on 14/03/18.
//  Copyright © 2018 LS. All rights reserved.
//

import UIKit

@IBDesignable
class triangleView: UIView {

    @IBInspectable
    var strokeColor: UIColor = UIColor.black
    
    @IBInspectable
    var fillColor: UIColor = UIColor.blue
    
    @IBInspectable
    var lineWidth: CGFloat = 3
    
    override func draw(_ rect: CGRect) {
        let path =    UIBezierPath()
        
        // Definição das linhas do triângulo
        path.move(to: CGPoint(x: rect.midX , y : lineWidth))
        path.addLine(to: CGPoint(x: lineWidth, y: rect.size.height - lineWidth))
        path.addLine(to: CGPoint(x: rect.size.width - lineWidth, y: rect.size.height - lineWidth))
        path.close()
        
        // Definição das propriedades inicias
        strokeColor.setStroke();
        fillColor.setFill()
        path.lineWidth = lineWidth
        path.fill()
        path.stroke()
        
    }

}
