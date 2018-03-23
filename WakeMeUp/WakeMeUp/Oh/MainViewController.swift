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

var alarmCount: Int = 0

class MainViewController: UIViewController {
    
    var testText: String?
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        // Navigation Title 설정
        self.navigationItem.title = "내가 널 깨워줄게!"
        
        //        // Navigation leftBarButtonItem & rightBarButtonItem 설정
        //        let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: nil)
        //        let addButton = UIBarButtonItem(title: "Add", style: .plain, target: self, action: nil)
        //
        //        self.navigationItem.leftBarButtonItem = editButton
        //        self.navigationItem.rightBarButtonItem = addButton
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

// MARK: - UITableView DataSoucre
extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell  = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath) as! MainCell
        
        if alarmCount > 0 {
            let dateFM = DateFormatter()
            dateFM.timeStyle = .short
            let dateStr = dateFM.string(from: AlarmData.date)
            
            cell.textLabel?.text = dateStr
        }
        
        return cell
    }
}


// MARK: - UITableView Delegate
extension MainViewController: UITableViewDelegate{
    
    // table cell 선택시 선택된 상태로 남아 있지 않도록 설정
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


