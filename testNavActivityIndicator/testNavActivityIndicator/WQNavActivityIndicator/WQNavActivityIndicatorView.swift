//
//  WQNavActivityIndicatorView.swift
//  testNavActivityIndicator
//
//  Created by CampbellQi on 2018/6/7.
//  Copyright © 2018年 CampbellQi. All rights reserved.
//

import UIKit

class WQNavActivityIndicatorView: UIView {
    
    private static let ANIMATING_TITLE: String? = "收取中"   //默认
    
    @objc var titleLable: UILabel!
    
    private var title: String!
    
    private var activityIndicatorView: UIActivityIndicatorView!
    
    @objc init(frame: CGRect, title: String) {
        super.init(frame: frame)
        
        self.title = title
        //设置大小
        
        self.frame = CGRect.init(x: 0, y: 0, width: 60, height: 44)
        self.backgroundColor = UIColor.black
        
        //活动指示器
        let ai = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
        activityIndicatorView = ai
        //        ai.startAnimating()
        ai.frame = CGRect.init(x: 0, y: 6, width: 20, height: 20)
        //                ai.backgroundColor = UIColor.purple
        ai.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
        //重新计算frame
        var ai_frame = ai.frame
        ai_frame.origin.x = 0
        ai_frame.origin.y = (self.frame.height-ai_frame.height)/2
        ai.frame = ai_frame
        self.addSubview(ai)
        
        
        //标题
        let titleLbl = UILabel.init(frame: CGRect.init(x: ai.frame.maxX+2, y: 0, width: 30, height: self.frame.height))
        titleLable = titleLbl
        titleLbl.textColor = UIColor.white
        titleLbl.font = UIFont.systemFont(ofSize: 18)
        self.addSubview(titleLbl)
        titleLbl.text = title
        //        titleLbl.backgroundColor = UIColor.red
        
        
        self.addSubview(titleLbl)
        
        self.resetTitleLabelFrame(x: nil)
        self.resetFrame()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func start() {
        if self.activityIndicatorView.isAnimating {
            return
        }
        self.activityIndicatorView.startAnimating()
        self.titleLable.text = WQNavActivityIndicatorView.ANIMATING_TITLE ?? self.title
        //计算宽度
        self.resetTitleLabelFrame(x: self.activityIndicatorView.frame.maxX)
        self.resetFrame()
    }
    
    @objc func stop() {
        if self.activityIndicatorView.isAnimating == false {
            return
        }
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1) {
            self.activityIndicatorView.stopAnimating()
            self.titleLable.text = self.title
            //计算宽度
            self.resetTitleLabelFrame(x: 0)
            self.resetFrame()
        }
        
        
    }
    
    private func resetTitleLabelFrame (x: CGFloat?) {
        //适配宽度
        let width = self.titleLable.sizeThatFits(CGSize.init(width: 1000, height: self.titleLable.frame.height)).width
        var titleLblFrame = self.titleLable.frame
        titleLblFrame.size.width = width
        if let x = x {
            titleLblFrame.origin.x = x
        }
        self.titleLable.frame = titleLblFrame
    }
    
    private func resetFrame() {
        //设置标题view
        var tvFrame = self.frame
        
        if (self.activityIndicatorView.isAnimating) {
            
        }
        tvFrame.size.width = self.titleLable.frame.maxX
        print("maxX = \(self.titleLable.frame.maxX)")
        self.frame = tvFrame
    }
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
