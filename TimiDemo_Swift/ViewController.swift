//
//  ViewController.swift
//  TimiDemo_Swift
//
//  Created by 杰刘 on 2018/1/3.
//  Copyright © 2018年 刘杰. All rights reserved.
//

import UIKit
import WCDBSwift

let kScreenHeight = UIScreen.main.bounds.size.height
let kScreenWidth = UIScreen.main.bounds.size.width
let kTopHeight = 170

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var timitableView:UITableView = UITableView()
    var timitopview:TimiTopView = TimiTopView()
    var addbutton:UIButton = UIButton()
    var lineLabel:UILabel = UILabel()
    var cycle:TimiCycleView = TimiCycleView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //隐藏navigation
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.barStyle = .blackOpaque
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "enum"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(enumclick(_:)))
        
        timitopview = TimiTopView.init(frame: CGRect(x:0,y:0,width:Int(kScreenWidth),height:kTopHeight))
        view.addSubview(timitopview)
        
        addbutton = UIButton.init(type: UIButtonType.custom)
        addbutton.frame = CGRect(x:timitopview.frame.size.width/2 - 40,y:timitopview.frame.size.height - 90,width:80,height:80)
        addbutton.layer.masksToBounds = true
        addbutton.backgroundColor = UIColor.white
        addbutton.layer.cornerRadius = 40
        addbutton.setImage(UIImage.init(named: "add"), for: UIControlState.normal)
        addbutton.addTarget(self, action: #selector(addclick), for: UIControlEvents.touchUpInside)
        timitopview.addSubview(addbutton)
        
        timitableView = UITableView()
        timitableView.frame = CGRect(x:0,y:timitopview.frame.maxY,width:kScreenWidth,height:kScreenHeight - 170)
        timitableView.separatorStyle = .none
        timitableView.estimatedRowHeight = 60//cell预估高度
        timitableView.rowHeight = UITableViewAutomaticDimension//cell高度自适应
        
        timitableView.delegate = self
        timitableView.dataSource = self
        view.addSubview(timitableView)
        
        lineLabel = UILabel.init(frame: CGRect(x:Int(kScreenWidth/2 - 0.5),y:kTopHeight - 10,width:1,height:10))
        lineLabel.backgroundColor = UIColor.gray
        view.addSubview(lineLabel)
        view.bringSubview(toFront: lineLabel)
    }
    
    @objc func addclick() {
        
        let detailVC = TimiAddViewController()
        self.present(detailVC, animated: true, completion: nil)
        
    }
    @objc func enumclick(_ button:UIButton) {
        print("enum")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let initIndentifier = "timicell"
        let cell = TimiCell(style:UITableViewCellStyle.subtitle,reuseIdentifier: initIndentifier)
        cell.selectionStyle = .none

        if indexPath.row == 1 {
            cell.leftnameLabel.text = "收入 100"
        }else{
            cell.rightnameLabel.text = "运动 2008"
        }
        if indexPath.row == 0 || indexPath.row == 4 {
            cell.dianlabel.isHidden = false
            cell.timelabel.isHidden = false
            cell.moneylabel.isHidden = false
            cell.leftButton.isHidden = false
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        let geight = 10 - offset
        if offset <= 0 {
            self.lineLabel.frame = CGRect(x:Int(kScreenWidth/2 - 0.5),y:kTopHeight - 10,width:1,height:Int(geight))
            self.animationWithCreateBtnDuration(time: 1.0, angle: offset)
        }
    }
    //旋转动画
    func animationWithCreateBtnDuration(time:TimeInterval,angle:CGFloat) -> Void {
        UIView.animate(withDuration: time) {
            self.addbutton.transform = CGAffineTransform.init(rotationAngle: angle/CGFloat(20))
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

