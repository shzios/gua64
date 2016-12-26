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
    var allTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "解卦"
        // Do any additional setup after loading the view.
        addUI()
    }
    func addUI() -> () {
        navigationItem.leftBarButtonItem  = UIBarButtonItem.init(image:UIImage.init(named: "navBar_back@2x.png"), style: UIBarButtonItemStyle.plain, target: self, action:#selector(OpenViewController.returnMulu))
        allTextView = UITextView(frame: CGRect(x: 10, y: 74, width: UIScreen.main.bounds.width - 20, height: UIScreen.main.bounds.height - 109))
        view.addSubview(allTextView);
        allTextView.text = textString
        allTextView.textColor = UIColor.white
        allTextView.backgroundColor = UIColor.clear
        allTextView.font = UIFont.systemFont(ofSize: 14)
        allTextView.isEditable = false
        allTextView.showsVerticalScrollIndicator = false
        automaticallyAdjustsScrollViewInsets = false
        view.shadeViewWithTwoColor(startColor: UIColor.red, startColorAlpha: 1, endColor: UIColor.yellow, endColorAlpha: 1, direction: .LeftTopToRightBottom)
        view.bringSubview(toFront: allTextView)
        
        let buttomButton = UIButton(type: .custom)
        buttomButton.frame = CGRect(x: 0, y: view.frame.height-30, width: view.frame.width, height: 20)
        view.addSubview(buttomButton)
        buttomButton.addTarget(self, action: #selector(keepOut), for: .touchUpInside)
        buttomButton.setTitle("退出", for: .normal)
    }
    func returnMulu(){
        self.navigationController!.popViewController(animated: true)
    }
    
    func keepOut() -> () {
        exit(0)
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
