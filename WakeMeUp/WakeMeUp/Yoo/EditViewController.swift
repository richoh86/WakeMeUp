//
//  EditViewController.swift
//  WakeMeUp
//
//  Created by richard oh on 2018. 3. 23..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    
    
    @IBOutlet weak var picker: UIDatePicker!
    @IBOutlet weak var table: UITableView!
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // Segue 정보를 받아서 Edit을 눌렀다면 2, +를 눌렀다면 1
        //return 2
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 4
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = indexPath.section
        let index = indexPath.row
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")
        cell = UITableViewCell(style: UITableViewCellStyle.value1, reuseIdentifier: "settingCell")
        
        if section == 0 {
            if index == 0 {
                cell!.textLabel!.text = "Repeat"
                //                cell?.detailTextLabel?.text =
                cell?.accessoryType = .detailDisclosureButton
            } else if index == 1 {
                cell!.textLabel!.text = "Label"
                //                cell?.detailTextLabel?.text =
                cell?.accessoryType = .detailDisclosureButton
            } else if index == 2 {
                cell!.textLabel!.text = "Sound"
                //                cell?.detailTextLabel?.text =
                cell?.accessoryType = .detailDisclosureButton
            } else if index == 3 {
                cell!.textLabel!.text = "Snooze"
                let sw = UISwitch()
                
                cell?.accessoryView = sw
            }
        } else if section == 1 {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "settingCell")
            cell?.textLabel?.text = "Delete Alarm"
            cell?.textLabel?.textColor = .red
            cell?.textLabel?.textAlignment = .center
        }
        
        return cell!
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let rightButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonAction(_:)))
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func saveButtonAction(_ sender: Any){
        print("save 버튼 호출")
        
        AlarmData.date = picker.date
        alarmCount += 1
        print(picker.date)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            let storyboard: UIStoryboard = self.storyboard!
            let nextView = storyboard.instantiateViewController(withIdentifier: "nextView")
            self.present(nextView, animated: true, completion: nil)
        } else if indexPath.row == 1 {
            let weekdays = self.storyboard?.instantiateViewController(withIdentifier: "weekdays") as! WeekdaysViewController
            present(weekdays, animated: true, completion: nil)
        } else if indexPath.row == 2 {
            let labeledit = self.storyboard?.instantiateViewController(withIdentifier: "labeledit") as! LabelEditViewController
            present(labeledit, animated: true, completion: nil)
        } else if indexPath.row == 3 {
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}

