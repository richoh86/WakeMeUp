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
  var label: String!
    override func viewDidLoad() {
        super.viewDidLoad()
      alarmTitleTf.becomeFirstResponder()
      alarmTitleTf.enablesReturnKeyAutomatically = true
      
    }

  // textfield done key
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
    label = alarmTitleTf.text
    
    return true
  }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
