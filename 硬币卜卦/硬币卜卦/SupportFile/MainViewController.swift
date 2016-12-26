//
//  MainViewController.swift
//  硬币卜卦
//
//  Created by 申克 on 2016/11/7.
//  Copyright © 2016年 shanghz. All rights reserved.
//




import UIKit

class MainViewController: UIViewController ,UITextFieldDelegate{
    
    let screenWidth = UIScreen.main.bounds.width

    var myTextField = UITextField()
    
    var imageMaskTransiton:ImageMaskTransition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "硬币卜卦法"
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.white
        let topImageView = UIImageView(frame: CGRect(x: 0, y: 64, width: screenWidth, height: view.frame.height/3))
        view.addSubview(topImageView)
        topImageView.image = UIImage.init(named: "topImage.jpg")
        
        let textfieldH:CGFloat = addHight(upView: topImageView) + CGFloat(10)
        myTextField = UITextField(frame: CGRect(x: 50, y: textfieldH, width: screenWidth - 100, height: 30))
        view.addSubview(myTextField)
        myTextField.delegate = self
        myTextField.placeholder = "请输入六次摇卦的结果..."
        myTextField.borderStyle = .roundedRect
        
        let textView = UITextView(frame: CGRect(x: 25, y: addHight(upView: myTextField), width:screenWidth - 40 , height: view.frame.height/4))
        view.addSubview(textView)
        textView.text = "使用建议：摇卦前请选择3枚五角钱硬币，新旧尽量一致，去除表面污垢。摇卦时心中默念请求的事情，然后散开手中硬币。摇卦结束时记录硬币正面出现的个数，共计六次，将所得的6个数字填入上面的输入框里，点击解卦，完成一次卜卦。例如：摇卦6次，每次出现正面的硬币个数为1，那么就填写111111。一个正面都没出现记为0，出现3个正面记为3。摇卦前尽量保持手掌清洁，同一事情不能多次摇卦请求，心境诚恳，所求向善。"
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.isEditable = false
        textView.backgroundColor = UIColor.clear
        textView.showsVerticalScrollIndicator = false
        
        let openButton = UIButton(type: .custom)
        openButton.frame = CGRect(x: 100, y: view.frame.height - 70, width: screenWidth-200, height: 40)
        view.addSubview(openButton)
        openButton.backgroundColor = UIColor.red
        openButton.setBackgroundImage(UIImage.init(named: "button.png"), for: .normal)
        openButton.layer.cornerRadius = 8
        openButton.setTitle("解卦", for: .normal)
        openButton.setTitleColor(UIColor.black, for: .normal)
        openButton.addTarget(self, action: #selector(MainViewController.pushJieGuai(_:)), for: .touchUpInside)

    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        myTextField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func pushJieGuai(_ sender: UIButton) -> () {
        let open = OpenViewController()
        let rightNumber = SpecificNumbersIsValidated(vStr: myTextField.text!)
        if rightNumber {
            imageMaskTransiton = ImageMaskTransition(fromImageView: sender, toImageView:open.allTextView)
            navigationController?.delegate = imageMaskTransiton
            
            let sixTitle = Bundle.main.path(forResource: "SixtyFourProperty", ofType: "plist")
            let array = NSArray.init(contentsOfFile: sixTitle!)
            var dict = NSDictionary()
            for s in array! {
                dict = s as! NSDictionary
                if let str = dict.object(forKey: myTextField.text!) {
                    open.textString = str as! String
                }
            }
            navigationController?.pushViewController(open, animated: true)
        }else{
            let alert = UIAlertController.init(title: "请输入正确的卦", message:"", preferredStyle:UIAlertControllerStyle.alert)
            let action = UIAlertAction.init(title:"确定", style: .default, handler: { (action) in
                self.myTextField.text = ""
            })
            alert.addAction(action)
            present(alert, animated: true, completion: nil)
        }
        
    }
    
    func addHight(upView:UIView) -> CGFloat {
        return upView.frame.height + upView.frame.origin.y + 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addTextToModel(text:String) -> NSDictionary {
        let dataDict = NSDictionary()
        return dataDict
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
