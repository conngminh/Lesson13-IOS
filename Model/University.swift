//
//  University.swift
//  Lesson13
//
//  Created by Lê Công Minh on 09/03/2022.
//

import Foundation
import HandyJSON

class University:HandyJSON {
    var country = ""
    var name = ""
    var domains = [Domains]()
    var alpha_two_code = ""
    var web_pages = [WebPage]()
    required init() {}
}

class Domains: HandyJSON {
    var key = ""
    required init() {}
}

class WebPage: HandyJSON {
    var key = ""
    required init() {}
}

