//
//  ViewController.swift
//  WakeMeUp
//
//  Created by richard oh on 2018. 3. 23..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import UIKit

enum storyBoardId{
    case main
    case edit
    case media
    case weekdays
    case labeledit
}

class MainViewController: UIViewController {

    
    @IBOutlet var tableView: UITableView!
    
    var alarmModel: Alarms = Alarms()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Navigation Title 설정
        self.navigationItem.title = "내가 널 깨워줄게!"
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let dates = UserDefaults.standard.stringArray(forKey: "dates")!
        
        for date in dates {
            print("저장된 알람들:", date)
        }
        
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func changeSwitchButtonState(index: Int) {
        //let info = notification.userInfo as! [String: AnyObject]
        //let index: Int = info["index"] as! Int
//        alarmModel = Alarms()
        if alarmModel.alarms[index].repeatWeekdays.isEmpty {
            alarmModel.alarms[index].enabled = false
        }
        let cells = tableView.visibleCells
        for cell in cells {
            if cell.tag == index {
                let sw = cell.accessoryView as! UISwitch
                if alarmModel.alarms[index].repeatWeekdays.isEmpty {
                    sw.setOn(false, animated: false)
                    cell.backgroundColor = UIColor.groupTableViewBackground
                    cell.textLabel?.alpha = 0.5
                    cell.detailTextLabel?.alpha = 0.5
                }
            }
        }
    }


}

// MARK: - UITableView DataSoucre
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var cnt = 0
        
        if let cntOfDates = UserDefaults.standard.stringArray(forKey: "dates")?.count, cntOfDates > 0 {
            
            print(cntOfDates)
            cnt = cntOfDates
        }
        
        print("cell 수량:",cnt)
        return cnt
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainCell
        
        
        if let dates = UserDefaults.standard.stringArray(forKey: "dates"), dates.count > 0 {
//            let alarmNames = UserDefaults.standard.stringArray(forKey: "alarmNames"), alarmNames.count > 0
            
            cell.insertTimeLabel = dates[indexPath.row]
            cell.alarmName.isHidden = true
//            cell.insertAlarmName = alarmNames[indexPath.row]
        
        }else{
            
            cell.timeLabel.isHidden = true
            cell.alarmName.isHidden = true
            cell.alarmSwitchOnOff.isHidden = true
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}


// MARK: - UITableView Delegate
extension MainViewController: UITableViewDelegate{
    
    // table cell 선택시 선택된 상태로 남아 있지 않도록 설정
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            var dates = UserDefaults.standard.stringArray(forKey: "dates")!
            dates.remove(at: indexPath.row)
            
            UserDefaults.standard.setValue(dates, forKey: "dates")
            
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        
        
        
        return true
    }
    
//   @objc func editButtonPressed(){
//        tableView.setEditing(!tableView.isEditing, animated: true)
//        if tableView.isEditing == true{
//            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: UIBarButtonItemStyle.plain, target: self, action: #selector)
//        }else{
//            navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: UIBarButtonItemStyle.plain, target: self, action: #selector)
//        }
//    }
    
//    func doneButtonAction(_ sender: UIBarButtonItem){
//        
//        let cell = tableView.dequeueReusableCell(withIdentifier: "MainCell") as? MainCell
//        
//        var dates = UserDefaults.standard.stringArray(forKey: "dates")!
//        dates.remove(at: indexPath.row)
//        
//        UserDefaults.standard.setValue(dates, forKey: "dates")
//        
//        self.tableView.reloadData()
//        
//        
//    }
}
