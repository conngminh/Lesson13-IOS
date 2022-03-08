//
//  ViewController.swift
//  Lesson13
//
//  Created by Lê Công Minh on 12/02/2022.
//

import UIKit
import Alamofire
class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var arrayData = [Entries]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupTableView()
        getDataFromAPI()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self

        let nib = UINib(nibName: "TableCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "tableCell")
    }
    
    func getDataFromAPI() { //BƯỚC 2 - dung alamorfire
        if let url = URL(string: "https://api.publicapis.org/entries") {
            AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).responseJSON { response in //response là dữ liệu trả vể
//                dump(response.value) kiểm tra xem có dữ liệu về hay chưa
                // response.value là giá trị trả về
            //Bước 3: parse json
                if let dict = response.value as? [String: Any] {
                    if dict.count > 0 { // kiểm tra có dữ liệu trả về hay không?
                        //dict là tập trả về có thể chọn: như là entries
                        if let data = dict["entries"] as? [NSDictionary] { //NSDictionary là handy json
                            //map về kiểu object của mình
                            let result = data.map({Entries.deserialize(from: $0)!})
                            //
                            self.arrayData = result
//                            self.arrayData.append(contentsOf: result)
                            self.tableView.reloadData()
                        }
                    } else {
                        print("Khong co du lieu tra ve")
                    }
                }
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableCell") as! TableCell
        let data = arrayData[indexPath.row]
        cell.lbAPI.text = data.API
        cell.lbDescription.text = data.Description
        cell.lbAuth.text = data.Auth
        cell.lbHTTPs.text = "\(data.HTTPS)"
        cell.lbCors.text = data.Cors
        cell.lbLink.text = data.Link
        cell.lbCategory.text = data.Category
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 217
    }

}



//Bước 1: Xây dựng UI
 // dùng post man để kiểm tra api có dữ liệu hay không
//Bước 2: Lấy Data từ api trả về - sử dụng alamofire
//Bước 3: Parse json (Lập trình hướng đối tượng – tạo object chứa các thuộc tính) -  sử dụng handy json
 // Tức là đưa dữ liệu json lấy về được đổi thành kiểu model để hiển thị dữ liệu
//Bước 4: Hiển thị dữ liệu lên UI


//
//3.    Thư viện quan trọng – API
//-    ALAMOREFIRE – GET POST API
//-    HANDY JSON – PARSE JSON

