//
//  OpenViewController.swift
//  硬币卜卦
//
//  Created by 申克 on 2016/11/7.
//  Copyright © 2016年 shanghz. All rights reserved.
//

import UIKit

class OpenViewController: UIViewController {
    
    var textString = String()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.red
        navigationItem.leftBarButtonItem  = UIBarButtonItem.init(image:UIImage.init(named: "navBar_back@2x.png"), style: UIBarButtonItemStyle.plain, target: self, action:#selector(OpenViewController.returnMulu))
        
        let textView = UITextView(frame: CGRect(x: 20, y: 120, width: UIScreen.main.bounds.width - 40, height: UIScreen.main.bounds.height - 150))
        view.addSubview(textView);
        textView.backgroundColor = UIColor.clear
        textView.font = UIFont.systemFont(ofSize: 16)


        let sixTitle = Bundle.main.path(forResource: "SixtyFourProperty", ofType: "plist")
        let array = NSArray.init(contentsOfFile: sixTitle!)
        var dict = NSDictionary()
        for s in array! {
            dict = s as! NSDictionary
            if let str = dict.object(forKey: textString) {
                textView.text = str as! String
            }
        }
        
        
        
        
        
        
    }
    func returnMulu(){
        self.navigationController!.popViewController(animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
