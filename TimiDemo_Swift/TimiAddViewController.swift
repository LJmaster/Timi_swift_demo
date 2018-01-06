//
//  TimiAddViewController.swift
//  TimiDemo_Swift
//
//  Created by 杰刘 on 2018/1/4.
//  Copyright © 2018年 刘杰. All rights reserved.
//

import UIKit



class TimiAddViewController: UIViewController {
    
    var closeButton:UIButton = UIButton()
    var incomeButton:UIButton = UIButton()
    var expensesButton:UIButton = UIButton()
    var titleView = UIView()
    var timidata = TimiData()
    
    
    var enumsegment = UISegmentedControl()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.white
        
        closeButton = UIButton.init(type: UIButtonType.custom)
        closeButton.frame = CGRect.init(x: 20, y: 25, width: 30, height: 30)
        closeButton.setImage(UIImage.init(named: "close_48"), for: UIControlState.normal)
        closeButton.addTarget(self, action: #selector(closeClick(button:)), for: UIControlEvents.touchUpInside)
        view.addSubview(closeButton)
        
        incomeButton = UIButton.init(type: UIButtonType.custom)
        incomeButton.frame = CGRect.init(x: kScreenWidth/2 - 55, y: 20, width: 50, height: 40)
        incomeButton.setTitle("收入", for: UIControlState.normal)
        incomeButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        incomeButton.setTitleColor(UIColor.orange, for: UIControlState.selected)
        incomeButton.isSelected = true
        incomeButton.tag = 1
        incomeButton.addTarget(self, action: #selector(incomeDidchange(segmented:)), for: UIControlEvents.touchUpInside)
        view.addSubview(incomeButton)
        
        expensesButton = UIButton.init(type: UIButtonType.custom)
        expensesButton.frame = CGRect.init(x: kScreenWidth/2 + 5, y: 20, width: 50, height: 40)
        expensesButton.setTitle("支出", for: UIControlState.normal)
        expensesButton.setTitleColor(UIColor.black, for: UIControlState.normal)
        expensesButton.setTitleColor(UIColor.orange, for: UIControlState.selected)
        expensesButton.tag = 2
        expensesButton.addTarget(self, action: #selector(expensesDidchange(segmented:)), for: UIControlEvents.touchUpInside)
        view.addSubview(expensesButton)
        
        titleView = UIView.init(frame: CGRect.init(x: 0, y: 64, width: kScreenWidth, height: 80))
        titleView.backgroundColor = UIColor.white
        view.addSubview(titleView)
        
        
        // Do any additional setup after loading the view.
    }
    
    @objc func closeClick(button:UIButton) -> Void {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func incomeDidchange(segmented:UIButton) -> Void {
        
        if segmented.isSelected == true {
            
        }else{
            incomeButton.isSelected = true
            expensesButton.isSelected = false
        }
        
        timidata.craetTable(baseDirectory: "jizhangbne.db")
        
    }
    @objc func expensesDidchange(segmented:UIButton) -> Void {
        
        if segmented.isSelected == true {
            
        }else{
            expensesButton.isSelected = true
            incomeButton.isSelected = false
        }
        
        self.animationWithBgColor(color: UIColor.init(red: CGFloat(Int(arc4random()%100)+1)/255.0, green: CGFloat(Int(arc4random()%100)+1)/255.0, blue: CGFloat(Int(arc4random()%100)+1)/255.0, alpha: 1), view: titleView)
    }
    
    func animationWithBgColor(color:UIColor,view:UIView) -> Void {
        
        let animation = CABasicAnimation.init(keyPath: "lineWidth")
        animation.fromValue = 0.0
        animation.toValue = kScreenWidth * 2
        animation.duration = 0.3
        
        let path = UIBezierPath.init()
        path.move(to: view.bounds.origin)
        path.addLine(to: CGPoint.init(x: view.frame.origin.x, y: view.frame.origin.y))
        
        let layer = CAShapeLayer.init()
        //* 设置路径 */
        layer.path = path.cgPath
        //* 设置填充色 */
        layer.fillColor = color.cgColor
        //* 设置边框色 */
        layer.strokeColor = color.cgColor
        view.layer.addSublayer(layer)
        
        animation.isRemovedOnCompletion = false
        animation.fillMode = kCAFillModeForwards
        layer.add(animation, forKey: "bgColorAnimation")
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
