//
//  LabelEditViewController.swift
//  WakeMeUp
//
//  Created by richard oh on 2018. 3. 23..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import UIKit

class LabelEditViewController: UIViewController, UITextFieldDelegate {
  // 알람 이름 작성 텍스트필드
  
  @IBOutlet weak var alarmTitleTf:UITextField!
    
    var arrayOfalarmTitleTf: [String] = []
    
//  var label: String?
    
    @IBAction func alarmNameConfirm(_ sender: Any) {
        
        if let txtOfAlarmName = alarmTitleTf.text, txtOfAlarmName != "" {
            
            if let cntOfalarmNamesUser = UserDefaults.standard.stringArray(forKey: "alarmNames")?.count,
                cntOfalarmNamesUser > 1 {
                
                arrayOfalarmTitleTf = UserDefaults.standard.stringArray(forKey: "alarNames")!
                
                arrayOfalarmTitleTf.append(txtOfAlarmName)
                UserDefaults.standard.setValue(arrayOfalarmTitleTf, forKey: "alarmNames")
            
            }else{
                
                UserDefaults.standard.setValue(txtOfAlarmName, forKey: "alarmNames")
                
            }
            
            self.navigationController?.popViewController(animated: true)
        
        }else{
            
            let alert = UIAlertController(title: "알람 이름 미입력", message: "", preferredStyle: .alert)
            let action = UIAlertAction(title: "확인!", style: .default, handler: { (action) in
                
               
            })
            
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        
//        self.navigationController?.popViewController(animated: true)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      alarmTitleTf.becomeFirstResponder()
      alarmTitleTf.enablesReturnKeyAutomatically = true
      
    }

  // textfield done key
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    alarmTitleTf.resignFirstResponder()
    
    return true
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
