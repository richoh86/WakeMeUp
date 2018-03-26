//
//  Persistant.swift
//  WakeMeUp
//
//  Created by richard oh on 2018. 3. 24..
//  Copyright © 2018년 richard oh. All rights reserved.
//

import Foundation

import Foundation

protocol Persistable{
    var ud: UserDefaults {get}
    var persistKey : String {get}
    func persist()
    func unpersist()
}
