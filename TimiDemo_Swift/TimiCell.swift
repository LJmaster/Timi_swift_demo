//
//  TimiCell.swift
//  TimiDemo_Swift
//
//  Created by 杰刘 on 2018/1/3.
//  Copyright © 2018年 刘杰. All rights reserved.
//

import UIKit

class TimiCell: UITableViewCell {
    let kScreenWidth = UIScreen.main.bounds.size.width
    let kScreenHeight = UIScreen.main.bounds.size.height
    var linelabel = UILabel()                  //线
    var dianlabel = UILabel()                  //点
    var timelabel = UILabel()                  //时间
    var moneylabel = UILabel()                 //金额
    var projectImageView = UIImageView()       //项目图片
    var rightnameLabel = UILabel()             //右边项目姓名
    var leftnameLabel = UILabel()              //左边项目名称
    var rightButton  = UIButton()              //右边备注照片
    var leftButton = UIButton()                //左边备注照片
   
    
    var imageview = UIImageView()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        linelabel = UILabel.init(frame: CGRect(x:kScreenWidth/2 - 0.5,y:0,width:1,height:80))
        linelabel.backgroundColor = UIColor.gray
        self.addSubview(linelabel)
        
        dianlabel = UILabel.init(frame: CGRect(x:kScreenWidth/2 - 4,y:21,width:8,height:8))
        dianlabel.backgroundColor = UIColor.gray
        dianlabel.layer.masksToBounds = true
        dianlabel.layer.cornerRadius = 4
        dianlabel.isHidden = true
        self.addSubview(dianlabel)
        
        moneylabel = UILabel.init(frame: CGRect(x:dianlabel.frame.maxX + 10,y:21,width:100,height:10))
        moneylabel.font = UIFont.systemFont(ofSize: 10)
        moneylabel.text = "2049.88"
        moneylabel.isHidden = true
        self.addSubview(moneylabel)
        
        timelabel = UILabel.init(frame: CGRect(x:kScreenWidth/2 - 4 - 10 - 100,y:21,width:100,height:10))
        timelabel.font = UIFont.systemFont(ofSize: 10)
        timelabel.textAlignment = .right
        timelabel.text = "2015.13.14"
        timelabel.isHidden = true
        self.addSubview(timelabel)
        
        projectImageView = UIImageView.init(frame: CGRect(x:kScreenWidth/2 - 15,y:dianlabel.frame.maxY + 21,width:30,height:30))
        projectImageView.backgroundColor = UIColor.init(red: CGFloat(Int(arc4random()%100)+1)/255.0, green: CGFloat(Int(arc4random()%100)+1)/255.0, blue: CGFloat(Int(arc4random()%100)+1)/255.0, alpha: 1)
        self.addSubview(projectImageView)
        
        rightButton = UIButton.init(type: UIButtonType.custom)
        rightButton.frame = CGRect.init(x: projectImageView.frame.maxX + 20, y: dianlabel.frame.maxY + 11, width: 40, height: 40)
        rightButton.addTarget(self, action: #selector(enlargeImgClick(button:)), for: UIControlEvents.touchUpInside)
        rightButton.setImage(UIImage.init(named: "beizhu"), for: UIControlState.normal)
        rightButton.backgroundColor = UIColor.gray
        rightButton.isHidden = true
        self.addSubview(rightButton)
        
        rightnameLabel = UILabel.init(frame: CGRect(x:projectImageView.frame.maxX + 20,y:dianlabel.frame.maxY + 26,width:kScreenWidth/2 - 50,height:20))
        rightnameLabel.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(rightnameLabel)
        
        leftButton = UIButton.init(type: UIButtonType.custom)
        leftButton.frame = CGRect.init(x: kScreenWidth/2 - 15 - 40 - 20, y: dianlabel.frame.maxY + 11, width: 40, height: 40)
        leftButton.addTarget(self, action: #selector(enlargeImgClick(button:)), for: UIControlEvents.touchUpInside)
        leftButton.backgroundColor = UIColor.gray
        leftButton.setImage(UIImage.init(named: "beizhu"), for: UIControlState.normal)
        leftButton.isHidden = true
        self.addSubview(leftButton)

        leftnameLabel = UILabel.init(frame: CGRect(x: 5,y:dianlabel.frame.maxY + 26,width:kScreenWidth/2 - 50,height:20))
        leftnameLabel.textAlignment = .right
        leftnameLabel.font = UIFont.systemFont(ofSize: 12)
        self.addSubview(leftnameLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    @objc func enlargeImgClick(button:UIButton) -> Void {
        //点击图片放大
        print("hahah")
        imageview = UIImageView.init(frame: CGRect.init(x: kScreenWidth/2, y: kScreenHeight/2, width: 0, height: 0))
        imageview.image = UIImage.init(named: "beizhu")
        imageview.isUserInteractionEnabled = true
        imageview.backgroundColor = UIColor.gray
        imageview.contentMode = .scaleAspectFit
        window?.addSubview(imageview)
        let tap = UITapGestureRecognizer.init(target: self, action: #selector(showZoomImageView(tap:)))
        imageview.addGestureRecognizer(tap)
        
        UIView.animate(withDuration: 0.2) {
            var frame = self.imageview.frame
            frame = CGRect.init(x: 0, y: 0, width: self.kScreenWidth, height: self.kScreenHeight)
            self.imageview.frame = frame
        }
        
       
    }
    @objc func showZoomImageView( tap : UITapGestureRecognizer) {
          UIView.animate(withDuration: 0.2) {
        self.imageview.isHidden = true
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
