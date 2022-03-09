//
//  CoinDesk.swift
//  Lesson13
//
//  Created by Lê Công Minh on 08/03/2022.
//

import Foundation
import HandyJSON

class CoinDesk: HandyJSON {
    var time = Time()
    var disclaimer = ""
    var chartName = ""
    var bpi = BPI()
    required init() {}
}

class Time: HandyJSON {
    var update = ""
    var updatedISO = ""
    var updateduk = ""
    
    required init() {}
}

class BPI: HandyJSON {
    var USD = Money()
    var GBP = Money()
    var EUR = Money()
    
    required init() {}
}

class Money: HandyJSON {
    var code = ""
    var symbol = ""
    var rate = ""
    var description = ""
    var rate_float = 0.0
    
    required init() {}
}
