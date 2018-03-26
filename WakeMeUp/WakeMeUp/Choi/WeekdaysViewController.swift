//
//  WeekdaysViewController.swift
//  WakeMeUp
//
//  Created by richard oh on 2018. 3. 23..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import UIKit
let weeks = ["Every Sunday", "Every Monday", "Every Tuesday", "Every Wednesday", "Every Thursday", "Every Friday", "Every Saturday", ]

class WeekdaysViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  var checkDays: [Int]!
  @IBOutlet weak var weeksTableView:UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return weeks.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = weeksTableView.dequeueReusableCell(withIdentifier: "weekCell", for: indexPath)
    cell.textLabel?.text = weeks[indexPath.row]
    
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let cell = weeksTableView.cellForRow(at: indexPath)!
    
    if cell.accessoryType == .checkmark {
      cell.accessoryType = .none
    }else{
      cell.accessoryType = .checkmark
    }
    
//    //cell 선택될때 체크마크
//    if cell.isSelected{
//
//      cell.accessoryType = .checkmark
//
//    }else{
//
//      cell.accessoryType = .none
//    }
    
  }
  
}
