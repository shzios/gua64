//
//  ViewController.swift
//  65
//
//  Created by 申克 on 2016/12/14.
//  Copyright © 2016年 shanghz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var MytextField = UITextField()
    var myStr1 = ""
    var myStr2 = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = UIColor.white
        MytextField = UITextField(frame: CGRect(x: 50, y: 100, width: view.frame.width-100, height: 30))
        view.addSubview(MytextField)
        MytextField.borderStyle = .line
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: view.frame.width/2-50, y: 150, width: 100, height: 50)
        view.addSubview(button)
        button.backgroundColor = UIColor.red
        button.addTarget(self, action:#selector(ViewController.jisuan) , for: .touchUpInside)
        button.setTitle("计算", for: .normal)
    }
    
    func zhuanhuan1(str:String) -> String {
        let firstStr = str
        let newStr = firstStr.replacingOccurrences(of: "0", with: "1")
        let fallStr = newStr.replacingOccurrences(of: "3", with: "2")
        return fallStr
    }
    
    func zhuanhuan2() -> String {
        let firstStr = MytextField.text!
        let newStr = firstStr.replacingOccurrences(of: "1", with: "5")
        let fallStr = newStr.replacingOccurrences(of: "2", with: "6")
        return fallStr
    }
    func zhuanhuan3(str:String) -> String {
        let firstStr = str
        let newStr = firstStr.replacingOccurrences(of: "5", with: "3")
        let fallStr = newStr.replacingOccurrences(of: "6", with: "0")
        return fallStr
    }
    
    func jisuan() -> () {
        let yuanStr = zhuanhuan2()
        let bianStr = zhuanhuan1(str: yuanStr)
        let newStr = zhuanhuan3(str: bianStr)
        let sixTitle = Bundle.main.path(forResource: "SixtyFourProperty", ofType: "plist")
        let array = NSArray.init(contentsOfFile: sixTitle!)
        var dict = NSDictionary()
        for s in array! {
            dict = s as! NSDictionary
            if let str1 = dict.object(forKey: newStr) {
                myStr1 = str1 as! String
            }
           // else if let str2 = dict.object(forKey: bianStr){
                //myStr2 = str2 as! String
            //}
            
        }
        print(myStr1)
       // print(myStr2)
    print("======================================================================================================================")
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

