//
//  MainCell.swift
//  WakeMeUp
//
//  Created by richard oh on 2018. 3. 23..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {

    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var alarmName: UILabel!
    @IBOutlet var alarmSwitchOnOff: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}