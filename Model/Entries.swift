//
//  Entries.swift
//  Lesson13
//
//  Created by Lê Công Minh on 08/03/2022.
//

import Foundation
import HandyJSON

class APIResponse: HandyJSON {
    var count = 0
    var entries = [Entries]()
    
    required init(){
    }
}

class Entries: HandyJSON { //MODEL CHO ENTRIES
    var API = ""
    var Description = ""
    var Auth = ""
    var HTTPS = false
    var Cors = ""
    var Link = ""
    var Category = ""
    
    required init() {
    }
}

