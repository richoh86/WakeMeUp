//
//  EditViewController.swift
//  WakeMeUp
//
//  Created by richard oh on 2018. 3. 23..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import UIKit

class EditViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
                //                cell?.detailTextLabel?.text =
                cell?.accessoryType = .detailDisclosureButton
            }
        } else if section == 1 {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "settingCell")
            cell?.textLabel?.text = "Delete Alarm"
            cell?.textLabel?.textColor = .red
            cell?.textLabel?.textAlignment = .center
        }
        
        return cell!
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    

}
