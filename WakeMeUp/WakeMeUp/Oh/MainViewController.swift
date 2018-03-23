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
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainCell
        
        let date = UserDefaults.standard.string(forKey: "date1")
        let alarmName = UserDefaults.standard.string(forKey: "alarmName")
        
        if date != nil {
            cell.insertTimeLabel = date
            cell.insertAlarmName = alarmName
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
}
