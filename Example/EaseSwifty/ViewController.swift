//
//  ViewController.swift
//  EaseSwifty
//
//  Created by 董招兵 on 2017/8/5.
//  Copyright © 2017年 大兵布莱恩特. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @objc func buttonClick(btn:UIButton,event:Any) {

        if let indexPath =  btn.indexPath(at: UITableView(), forEvent: event) {
            print(indexPath)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

