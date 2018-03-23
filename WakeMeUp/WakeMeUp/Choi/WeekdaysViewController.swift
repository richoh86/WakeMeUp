//
//  WeekdaysViewController.swift
//  WakeMeUp
//
//  Created by richard oh on 2018. 3. 23..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import UIKit

let weeks = [
    "Every Sunday",
    "Every Monday",
    "Every Tuesday",
    "Every Wednesday",
    "Every Thursday",
    "Every Friday",
    "Every Saturday"
]

var weakInt: [Int] = []

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
        let index = weakInt.index(of: indexPath.row)
        weakInt.remove(at: index!)
    }else{
      cell.accessoryType = .checkmark
        weakInt.append(indexPath.row)
    }
//    test
//    print(weakInt)
    
//    현재는 UserDefaults.standard.weakdays 없음
//    UserDefaults.standard.weakdays = checkWeek(weakInt)
    print(checkWeek(weaks: weakInt))
  }
}


extension WeekdaysViewController {
    func checkWeek(weaks: [Int]) -> String {
        if weaks.count == 7 {
            return "Everyday"
        }
        if weaks.isEmpty {
            return "Never"
        }
        
        var str = String()
        let sortedWeaks = weaks.sorted()
        
        for weak in sortedWeaks {
            switch weak {
            case 0:
                str += ",Sun"
            case 1:
                str += ",Mon"
            case 2:
                str += ",Tue"
            case 3:
                str += ",Wed"
            case 4:
                str += ",Thu"
            case 5:
                str += ",Fri"
            case 6:
                str += ",Sat"
            default:
                break
            }
        }
        str.removeFirst()
        return str
    }
}
