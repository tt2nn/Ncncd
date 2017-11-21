//
//  NcncdRegisterVC.swift
//  Ncncd
//  注册界面
//  Created by lihaotian on 2017/11/14.
//  Copyright © 2017年 miao. All rights reserved.
//

import UIKit
import MBProgressHUD

public class NcncdRegisterVC: UIViewController {
    
    // 手机号输入框
    @IBOutlet weak var tfPhone: UITextField!
    // 身高输入框
    @IBOutlet weak var tfHeight: UITextField!
    // 体重输入框
    @IBOutlet weak var tfWeight: UITextField!
    
    // 性别男选择
    @IBOutlet weak var btnMan: UIButton!
    // 性别女选择
    @IBOutlet weak var btnWoman: UIButton!
    // 性别保密选择
    @IBOutlet weak var btnSecrecy: UIButton!
    // 临时缓存性别按钮
    var radioBtn: UIButton?
    var sex = 3
    
    // 生日年
    @IBOutlet weak var lbYear: UILabel!
    // 生日月
    @IBOutlet weak var lbMonth: UILabel!
    // 生日日
    @IBOutlet weak var lbDay: UILabel!
    // 生日年按钮
    @IBOutlet weak var btnYear: UIButton!
    // 生日月按钮
    @IBOutlet weak var btnMonth: UIButton!
    // 生日日按钮
    @IBOutlet weak var btnDay: UIButton!
    // 生日选择器
    var birthdaySettingAlert: BirthdaySettingAlert!
    // 生日
    var birthdayDate: Date?
    
    // 同意选择框
    @IBOutlet weak var btnAgree: UIButton!
    // 是否同意
    var agree = false
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        self.title = "完善信息"
        
        // 初始化 手机号、身高、体重 输入框
        initInputTF(textTf: tfPhone)
        initInputTF(textTf: tfHeight)
        initInputTF(textTf: tfWeight)
        
        // 默认性别选中保密
        radioBtn = btnSecrecy
        
        // 初始化 年、月、日 按钮
        initBirthdayBtn(button: btnYear)
        initBirthdayBtn(button: btnMonth)
        initBirthdayBtn(button: btnDay)
        
    }
    
    /// 初始化输入框样式
    ///
    /// - Parameter textTf: 输入框
    func initInputTF(textTf: UITextField){
        
        // 修改输入框边框
        textTf.borderStyle = UITextBorderStyle.none
        textTf.layer.borderWidth = 1.5
        textTf.layer.borderColor = NcncdUtil.colorHex(hexString: "C0C0C0").cgColor
        // 修改输入框内间距
        textTf.setValue(10, forKey: "paddingLeft")
    }
    
    /// 初始化生日按钮样式
    ///
    /// - Parameter button: 年、月、日 按钮
    func initBirthdayBtn(button: UIButton) {
        
        button.layer.borderWidth = 1.5
        button.layer.borderColor = NcncdUtil.colorHex(hexString: "C0C0C0").cgColor
        button.titleEdgeInsets = UIEdgeInsetsMake(0, -(button.frame.size.width - 10), 0, 0)
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -(button.frame.size.width - 15))
    }
    
    /// 初始化生日选择器
    func initBirthdaySetting() {
        
        birthdaySettingAlert = BirthdaySettingAlert(title: "", message: "", preferredStyle: .actionSheet)
        birthdaySettingAlert.setDatePickerListener(){
            
            (birthday: Date) -> Void in
            
            self.birthdayDate = birthday
            
            let dateComponents = Calendar.current.dateComponents([.year, .month, .day], from: birthday)
            
            self.lbYear.text = "  \(dateComponents.year!) 年"
            self.lbMonth.text = "  \(dateComponents.month!) 月"
            self.lbDay.text = "  \(dateComponents.day!) 日"
            
        }
    }
    
    /// 监听手机号输入框输入变化，用于限制字数11位
    ///
    /// - Parameter sender: sender
    @IBAction func actionPhoneLength(_ sender: Any) {
        
        setUpTfLength(textF: tfPhone, length: 11)
    }
    
    /// 监听身高输入框输入变化，用于限制字数3位
    ///
    /// - Parameter sender: sender
    @IBAction func actionHeightLength(_ sender: Any) {
        
        setUpTfLength(textF: tfHeight, length: 3)
    }
    
    /// 监听体重输入框输入变化，用于限制字数7位
    ///
    /// - Parameter sender: sender
    @IBAction func actionWeightLength(_ sender: Any) {
        
        setUpTfLength(textF: tfWeight, length: 7)
    }
    
    /// 限制输入框字数
    ///
    /// - Parameters:
    ///   - textF: 输入框
    ///   - length: 长度
    func setUpTfLength(textF: UITextField , length: Int) {
        
        let text = textF.text!
        
        if text.count > length {
            
            textF.text = text.substring(to: text.index(before: text.endIndex))
        }
    }
    
    /// 选择男人
    ///
    /// - Parameter sender: sender
    @IBAction func actionSelectMan(_ sender: Any) {
        
        changeRadioBtn(button: btnMan)
        sex = 1
    }
    
    /// 选择女人
    ///
    /// - Parameter sender: sender
    @IBAction func actionSelectWoman(_ sender: Any) {
        
        changeRadioBtn(button: btnWoman)
        sex = 2
    }
    
    /// 选择保密
    ///
    /// - Parameter sender: sender
    @IBAction func actionSelectSecrecy(_ sender: Any) {
        
        changeRadioBtn(button: btnSecrecy)
        sex = 3
    }
    
    /// 性别切换
    ///
    /// - Parameter button: 按钮
    func changeRadioBtn(button: UIButton) {
        
        guard radioBtn != button else {
            
            return
        }
        
        button.setImage(UIImage(named: "btn-radio-select"), for: .normal)
        radioBtn?.setImage(UIImage(named: "btn-radio-normal"), for: .normal)
        radioBtn = button
    }
    
    /// 点击生日选择
    ///
    /// - Parameter sender: sender
    @IBAction func actionBirthdayGet(_ sender: Any) {
        
        initBirthdaySetting()
        
        if birthdayDate != nil {
            
            birthdaySettingAlert.setDate(date: birthdayDate!)
        }
        
        self.present(birthdaySettingAlert, animated: true, completion: nil)
    }
    
    /// 确认处理
    ///
    /// - Parameter sender: sender
    @IBAction func actionConfirm(_ sender: Any) {
        
        if NcncdConfigure.appKey.isEmpty || NcncdConfigure.appSecret.isEmpty {
            
            print("请配置appKey和appSecret")
            return
        }
        
        var phone = ""
        var weight: Float = 0.0
        var height = 0
        var birthday = ""
        
        if (tfPhone.text?.isEmpty)! {
            
            showToast(message: "请填写手机号")
            return
        }
        
        if !NcncdUtil.checkMobile(tfPhone.text!) {
            
            showToast(message: "手机号格式错误")
            return
        }
        
        if !agree {
            
            showToast(message: "请同意协议")
            return
        }
        
        phone = tfPhone.text!
        
        if !tfHeight.text!.isEmpty{
            
            height = Int(tfHeight.text!)!
        }
        
        if !tfWeight.text!.isEmpty{
            
            if Float(tfWeight.text!) == nil {
                
                showToast(message: "体重格式错误")
                return
            }
            
            weight = Float(tfWeight.text!)!
        }
        
        if birthdayDate != nil {
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "YYYY-MM-dd"
            birthday = dateFormatter.string(from: birthdayDate!)
        }
        
        let ncncdRegisterModel = NcncdRegisterModel()
        ncncdRegisterModel.setCallBack(success: {
            
            () -> Void in
            
            self.showToast(message: "注册成功")
            self.navigationController?.popViewController(animated: true)
            
        }, error: {
            
            (errMsg: String) -> Void in
            
            self.showToast(message: errMsg)
        })
        
        ncncdRegisterModel.uploadUser(phone: phone, sex: sex, weight: weight, height: height, birthday: birthday)
    }
    
    /// 协议同意处理
    ///
    /// - Parameter sender: sender
    @IBAction func actionAgree(_ sender: Any) {
        
        if agree {
            
            agree = false
            btnAgree.setImage(UIImage(named: "btn-radio-normal"), for: .normal)
            
        }else{
            
            agree = true
            btnAgree.setImage(UIImage(named: "btn-radio-select"), for: .normal)
        }
    }
    
    /// VVHHGGj协议跳转
    ///
    /// - Parameter sender: sender
    @IBAction func actionAgreement1(_ sender: Any) {
        
        let bundle = Bundle(identifier: "cn.miao.Ncncd")
        let webViewVC = WebViewVC.init(nibName: "WebViewVC", bundle: bundle)
        self.navigationController?.pushViewController(webViewVC, animated: true)
    }
    
    /// 隐私保护说明协议跳转
    ///
    /// - Parameter sender: sender
    @IBAction func actionAgreement2(_ sender: Any) {
        
        let bundle = Bundle(identifier: "cn.miao.Ncncd")
        let webViewVC = WebViewVC.init(nibName: "WebViewVC", bundle: bundle)
        self.navigationController?.pushViewController(webViewVC, animated: true)
    }
    
    /// Toast提示
    ///
    /// - Parameter message: 提示内容
    func showToast(message: String) {
        
        let toast = MBProgressHUD(view: self.view)
        toast.mode = .text
        toast.label.text = message
        self.view.addSubview(toast)
        toast.show(animated: true)
        toast.hide(animated: true, afterDelay: 1)
        
    }
    
    /// 回收键盘
    ///
    /// - Parameters:
    ///   - touches:
    ///   - event:
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        view.endEditing(true)
    }
    
    override public func didReceiveMemoryWarning() {
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
