//
//  ViewController.swift
//  DigInFLAnimatedImageView
//
//  Created by tepmnthar on 2017/3/31.
//  Copyright © 2017年 tepmnthar. All rights reserved.
//

import UIKit
import FLAnimatedImage

class ViewController: UIViewController {

    var uiImageView: UIImageView!
    var flAnimatedImageView: FLAnimatedImageView!
    var switchTest: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        uiImageView = UIImageView(frame: CGRect(x: 50, y: 50, width: 50, height: 50))
        self.view.addSubview(uiImageView)
        
        uiImageView.image = UIImage(named: "Image")?.withRenderingMode(.alwaysTemplate)
        
        flAnimatedImageView = FLAnimatedImageView(frame: CGRect(x: 50, y: 150, width: 50, height: 50))
        self.view.addSubview(flAnimatedImageView)
        
        flAnimatedImageView.image = UIImage(named: "Image")?.withRenderingMode(.alwaysTemplate)
        
        [uiImageView, flAnimatedImageView].forEach { (view: UIView) in
            view.tintColor = UIColor.yellow
        }
        
        switchTest = UISwitch(frame: CGRect(x: 50, y: 250, width: 40, height: 20))
        self.view.addSubview(switchTest)
        
        switchTest.addTarget(self, action: #selector(clickSwitchTest(sender:)), for: .valueChanged)
    }

    func clickSwitchTest(sender: AnyObject) -> Void {
        let isOn = (sender as! UISwitch).isOn
        if isOn {
            uiImageView.image = UIImage(named: "Image")?.withRenderingMode(.alwaysTemplate)
            flAnimatedImageView.image = UIImage(named: "Image")?.withRenderingMode(.alwaysTemplate);
        } else {
            uiImageView.image = UIImage(named: "Image")?.withRenderingMode(.alwaysTemplate)
            flAnimatedImageView.image = UIImage(named: "Image")?.withRenderingMode(.alwaysTemplate);
            
            let colors = [UIColor.yellow, UIColor.blue, UIColor.red, UIColor.green]
            var flag = false
            while !flag {
                // You can only use a different tintColor to refresh the view
                let index = Int(arc4random_uniform(10000)) % 4
                if (colors[index] != flAnimatedImageView.tintColor) {
                    flAnimatedImageView.tintColor = colors[index]
                    uiImageView.tintColor = colors[index]
                    flag = true
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

