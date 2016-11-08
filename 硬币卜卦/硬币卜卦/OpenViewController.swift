//
//  OpenViewController.swift
//  硬币卜卦
//
//  Created by 申克 on 2016/11/7.
//  Copyright © 2016年 shanghz. All rights reserved.
//

import UIKit

class OpenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        title = "乾为天"
        view.backgroundColor = UIColor.red
        navigationItem.leftBarButtonItem  = UIBarButtonItem.init(image:UIImage.init(named: "navBar_back@2x.png"), style: UIBarButtonItemStyle.plain, target: self, action:#selector(OpenViewController.returnMulu))
        
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
