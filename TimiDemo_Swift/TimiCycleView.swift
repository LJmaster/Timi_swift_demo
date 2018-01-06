//
//  TimiCycleView.swift
//  TimiDemo_Swift
//
//  Created by 杰刘 on 2018/1/3.
//  Copyright © 2018年 刘杰. All rights reserved.
//

import UIKit

class TimiCycleView: UIView {

    let PROGRESS_LINE_WIDTH :CGFloat = 4
    var progressLayer = CAShapeLayer()
    var progress:Float = 0
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let arcCenter = CGPoint.init(x: self.frame.size.width/2, y: self.frame.size.width/2)
        let radius = frame.size.width/2
        
        let path = UIBezierPath.init(arcCenter: arcCenter, radius: radius, startAngle: CGFloat(M_PI_2), endAngle: CGFloat(M_PI*2+M_PI_2), clockwise: true)
        let shapLayer = CAShapeLayer.init()
        shapLayer.path = path.cgPath
        shapLayer.fillColor = UIColor.clear.cgColor//图形填充色
        let grayColor = UIColor.init(red: 155/255.0, green: 155/255.0, blue: 155/255.0, alpha: 1)
        shapLayer.strokeColor = grayColor.cgColor//边线颜色
        shapLayer.lineWidth = 4
        self.layer.addSublayer(shapLayer)
        //渐变图层 渐变：RYUIColorWithRGB(140, 94, 0)   >>  RYUIColorWithRGB(229, 168, 46)   >>    RYUIColorWithRGB(140, 94, 0)
        let grain = CALayer.init()
        self.layer.addSublayer(grain)
        //我们是两种渐变色，所以我么要用一个grain 对象将两个渐变图层放到一起。
        let gradientLayer = CAGradientLayer.init()
        gradientLayer.frame = CGRect(x:-PROGRESS_LINE_WIDTH,y:-PROGRESS_LINE_WIDTH,width:frame.size.width/2 + CGFloat(PROGRESS_LINE_WIDTH*2),height:frame.size.height + CGFloat(PROGRESS_LINE_WIDTH*2))
        gradientLayer.locations = [0.1,0.9]
        gradientLayer.startPoint = CGPoint.init(x: 0.05, y: 1)
        gradientLayer.endPoint = CGPoint.init(x: 0.9, y: 1)
        grain.addSublayer(gradientLayer)
        
        let gradientLayer1 = CAGradientLayer.init()
        gradientLayer1.frame = CGRect(x:self.bounds.size.width/2-PROGRESS_LINE_WIDTH,y:-PROGRESS_LINE_WIDTH,width:frame.size.width/2+PROGRESS_LINE_WIDTH*2,height:frame.size.height+PROGRESS_LINE_WIDTH*2)
        gradientLayer1.locations = [0.3,1]
        gradientLayer1.startPoint = CGPoint.init(x: 0.9, y: 0.05)
        gradientLayer1.endPoint = CGPoint.init(x: 1, y: 1)
        grain.addSublayer(gradientLayer1)
        //设置遮罩层:
        //进度layer
        self.progressLayer = CAShapeLayer.init()
        self.layer.addSublayer(self.progressLayer)
        self.progressLayer.path = path.cgPath
        self.progressLayer.strokeColor = UIColor.blue.cgColor
        self.progressLayer.fillColor = UIColor.clear.cgColor
        self.progressLayer.lineWidth = PROGRESS_LINE_WIDTH
        self.progressLayer.strokeEnd = 0.0
        grain.mask = self.progressLayer
         self.startAninationWithPro(pro: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  
    func startAninationWithPro(pro:Float) -> Void {
        let pathAnimation = CABasicAnimation.init(keyPath: "strokeEnd")
        pathAnimation.duration = 3
        pathAnimation.timingFunction = CAMediaTimingFunction.init(name: kCAMediaTimingFunctionLinear)
        pathAnimation.fromValue = NSNumber.init(value: 0.0)
        pathAnimation.toValue = NSNumber.init(value: pro)
        pathAnimation.autoreverses = false
        
        pathAnimation.fillMode = kCAFillModeForwards
        pathAnimation.isRemovedOnCompletion = false
        pathAnimation.repeatCount = 1
        self.progressLayer.add(pathAnimation, forKey: "strokeEndAnimation")
        
    }
}
