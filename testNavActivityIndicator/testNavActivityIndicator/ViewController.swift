//
//  ViewController.swift
//  testNavActivityIndicator
//
//  Created by CampbellQi on 2018/6/7.
//  Copyright © 2018年 CampbellQi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var wqNav: WQNavActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "订单"
        
        let attr = [NSAttributedStringKey.font:UIFont.systemFont(ofSize: 18),NSAttributedStringKey.foregroundColor:UIColor.white];
        self.navigationController?.navigationBar.titleTextAttributes = attr
        
        
        self.showNavActivityIndicator()
    }
    @IBAction func start(_ sender: Any) {
        self.showNavActivityIndicator()
    }
    
    @IBAction func stop(_ sender: Any) {
        self.hideNavActiviyIndicator()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

