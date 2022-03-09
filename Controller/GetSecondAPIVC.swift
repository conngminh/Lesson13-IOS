//
//  GetSecondAPIVC.swift
//  Lesson13
//
//  Created by Lê Công Minh on 09/03/2022.
//

import UIKit
import Alamofire
class GetSecondAPIVC: UIViewController {

    @IBOutlet weak var lbActivity: UILabel!
    @IBOutlet weak var lbType: UILabel!
    @IBOutlet weak var lbParticipants: UILabel!
    @IBOutlet weak var lbPrice: UILabel!
    @IBOutlet weak var lbLink: UILabel!
    @IBOutlet weak var lbKey: UILabel!
    @IBOutlet weak var lbAccessibility: UILabel!
    
    var activity: Activity?
    override func viewDidLoad() {
        super.viewDidLoad()
        getDataFromAPI()
    }
    
    func getDataFromAPI() {
        guard let url = URL(string: "https://www.boredapi.com/api/activity") else {
            return
        }
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseJSON { response in
            
            if let dict = response.value as? [String: Any] {
                let data = dict.map({_ in Activity.deserialize(from: dict)!})
                if data.count > 0 {
                    self.activity = data[0]
                    self.bindData(result: self.activity)
                }
            }
        }
    }
    
    func bindData(result: Activity?) {
        if let data = result {
            lbActivity.text = data.activity
            lbType.text = data.type
            lbParticipants.text = "\(data.participants)"
            lbPrice.text = "\(data.price)"
            lbLink.text = data.link
            lbKey.text = data.key
            lbAccessibility.text = "\(data.accessibility)"
        }
    }
}

