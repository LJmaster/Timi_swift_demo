//
//  TimiTopView.swift
//  TimiDemo_Swift
//
//  Created by 杰刘 on 2018/1/3.
//  Copyright © 2018年 刘杰. All rights reserved.
//

import UIKit



class TimiTopView: UIView {

    let kScreenHeight = UIScreen.main.bounds.size.height
    let kScreenWidth = UIScreen.main.bounds.size.width
    var topimageview:UIImageView = UIImageView()
    var leftLabel:UILabel = UILabel()
    var righLabel:UILabel = UILabel()
    
    var leftDetailLabel:UILabel = UILabel()
    var righDetailLabel:UILabel = UILabel()
    
    var leftbutton:UIButton = UIButton()
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        topimageview = UIImageView.init(frame: CGRect(x:0,y:0,width:kScreenWidth,height:120))
        topimageview.backgroundColor = .red
        topimageview.isUserInteractionEnabled = true
        self.addSubview(topimageview)
        
//        leftbutton = UIButton.init(type: UIButtonType.custom)
//        leftbutton.frame = CGRect(x:10,y:20,width:40,height:40)
//        leftbutton.setImage(UIImage.init(named: "enum"), for: .normal)
//        leftbutton.addTarget(self, action: #selector(enumclick(_:)), for: UIControlEvents.touchUpInside)
//        self.addSubview(leftbutton)
        
        leftLabel = UILabel.init(frame: CGRect(x:10,y:topimageview.frame.maxY + 5,width:60,height:20))
        leftLabel.text = "当月收入"
        leftLabel.textColor = UIColor.lightGray
        leftLabel.font = UIFont.systemFont(ofSize: 12)
        leftLabel.textAlignment = .left
        self.addSubview(leftLabel)
        
        leftDetailLabel = UILabel.init(frame: CGRect(x:10,y:leftLabel.frame.maxY ,width:120,height:20))
        leftDetailLabel.text = "0.00"
        leftDetailLabel.textColor = UIColor.lightGray
        leftDetailLabel.font = UIFont.systemFont(ofSize: 12)
        leftDetailLabel.textAlignment = .left
        self.addSubview(leftDetailLabel)
        
        righLabel = UILabel.init(frame: CGRect(x:kScreenWidth - 70,y:topimageview.frame.maxY + 5,width:60,height:20))
        righLabel.text = "当月支出"
        righLabel.font = UIFont.systemFont(ofSize: 12)
        righLabel.textColor = UIColor.lightGray
        righLabel.textAlignment = .right
        self.addSubview(righLabel)
        
        righDetailLabel = UILabel.init(frame: CGRect(x:kScreenWidth - 130,y:righLabel.frame.maxY ,width:120,height:20))
        righDetailLabel.text = "8864459.00"
        righDetailLabel.font = UIFont.systemFont(ofSize: 12)
        righDetailLabel.textColor = UIColor.lightGray
        righDetailLabel.textAlignment = .right
        self.addSubview(righDetailLabel)
    }
 
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
