//
//  EditViewController.swift
//  WakeMeUp
//
//  Created by richard oh on 2018. 3. 23..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import UIKit
import AVFoundation

//let timeSelector: Selector = #selector(EditViewController.updateTime)
//var currentTime: String!


class EditViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var picker: UIDatePicker!
    @IBOutlet weak var table: UITableView!
    
    var alarm: Bool = true
    var selectTime: String!
    var currentTime: String!
    let timeSelector: Selector = #selector(EditViewController.updateTime)
    var arrayOfDateInUserdefault: [String] = []
    
    var setTimeInUserDefault: [String] = []
    
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
                cell!.textLabel!.text = "반복요일"
                //                cell?.detailTextLabel?.text =
                cell?.accessoryType = .detailDisclosureButton
            } else if index == 1 {
                cell!.textLabel!.text = "알람이름"
                //                cell?.detailTextLabel?.text =
                cell?.accessoryType = .detailDisclosureButton
            } else if index == 2 {
                cell!.textLabel!.text = "벨소리"
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        // 반복요일
        if indexPath.row == 0{
            
        // 알람이름
        }else if indexPath.row == 1{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let labelEditVC = storyboard.instantiateViewController(withIdentifier: "labeledit")
            tableView.deselectRow(at: indexPath, animated: true)
            self.navigationController?.pushViewController(labelEditVC, animated: true)
            
        
        // 벨소리
        }else if indexPath.row == 2{
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let mediaEditVC = storyboard.instantiateViewController(withIdentifier: "media")
            tableView.deselectRow(at: indexPath, animated: true)
            self.navigationController?.pushViewController(mediaEditVC, animated: true)
            
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let rightButton = UIBarButtonItem(title: "Save", style: .plain, target: self, action: #selector(saveButtonAction(_:)))
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func saveButtonAction(_ sender: Any){
        print("save 버튼 호출")
    
        let dateFM = DateFormatter()
        dateFM.timeStyle = .short
        let dateStr = dateFM.string(from: picker.date)
        
//        selectTime = dateStr
        
        if let aCnt = UserDefaults.standard.stringArray(forKey: "dates")?.count, aCnt > 0 {
            
            guard let dates = UserDefaults.standard.stringArray(forKey: "dates") else {return}
            arrayOfDateInUserdefault = dates
            
        }
            
        arrayOfDateInUserdefault.append(dateStr)
        UserDefaults.standard.setValue(arrayOfDateInUserdefault, forKey: "dates")
    
//        print("선택된 시간:",selectTime)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func updateTime(){
        
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        currentTime = formatter.string(from: date as Date)
        
//        print("현재 시간:",currentTime)
//        print("선택된 시간:",selectTime)
        
        guard let setTimeInUserDefault = UserDefaults.standard.stringArray(forKey: "dates") else {return}
        
        for selectTime in setTimeInUserDefault{
        
        if currentTime == selectTime{
            if alarm{
                callAlert()
            }
        }
      }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         Timer.scheduledTimer(timeInterval: 1, target: self, selector: timeSelector, userInfo: nil, repeats: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    func callAlert(){
        playAlarm()
        let alert = UIAlertController(title:"알림",message:"시간됐어요", preferredStyle:UIAlertControllerStyle.alert)
        
        let action = UIAlertAction(title:"끄기",style:UIAlertActionStyle.default, handler:{
            //알람끄기
            ACTION in
            self.alarm = false
            //self.alarm = false
            self.audioPlayer.stop()
        })
        alert.addAction(action)
        self.present(alert,animated: true, completion: nil)
        
    }
    var audioPlayer: AVAudioPlayer!
    func playAlarm(){
        let url = Bundle.main.url(forResource: "bell", withExtension: "mp3")!
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            guard let player = audioPlayer else { return }
            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
