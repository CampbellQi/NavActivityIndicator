//
//  WQNavActivityIndicatorView.swift
//  testNavActivityIndicator
//
//  Created by CampbellQi on 2018/6/7.
//  Copyright © 2018年 CampbellQi. All rights reserved.
//

import UIKit

class WQNavActivityIndicatorView: UIView {

    //工厂模式初始化
    @objc class func wqNavActivityIndicatorView(title: String, textAttributes: [NSAttributedStringKey: Any], needIndicator: Bool = false) -> WQNavActivityIndicatorView {
        var ai: UIActivityIndicatorView? = nil
        if needIndicator {
            //菊花
            ai = UIActivityIndicatorView.init(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
            ai?.frame = CGRect.init(x: 0, y: 0, width: 20, height: 20)
            ai?.transform = CGAffineTransform.init(scaleX: 1.2, y: 1.2)
            ai?.startAnimating()
        }
        
        //标题
        let titleLbl = UILabel.init(frame: CGRect.init(x: (ai==nil ? 0: ai!.frame.maxX)+2, y: 0, width: 30, height: 44))
        titleLbl.font = textAttributes[NSAttributedStringKey.font] as? UIFont
        titleLbl.textColor = textAttributes[NSAttributedStringKey.foregroundColor] as? UIColor
        titleLbl.text = title
//        titleLbl.backgroundColor = UIColor.red
        
        let width = titleLbl.sizeThatFits(CGSize.init(width: 1000, height: titleLbl.frame.height)).width
        var titleLblFrame = titleLbl.frame
        titleLblFrame.size.width = width
        titleLbl.frame = titleLblFrame
        
        let x = (UIScreen.main.bounds.width-titleLbl.frame.maxX) / 2
        let view = WQNavActivityIndicatorView.init(frame: CGRect.init(x: x, y: 0, width: titleLbl.frame.maxX, height: 44))
        view.addSubview(titleLbl)
        if let ai = ai {
            view.addSubview(ai)
            var center = ai.center
            center.y = view.frame.height / 2
            ai.center = center
        }
        
        return view
    }
}
