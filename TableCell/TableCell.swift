//
//  TableCell.swift
//  Lesson13
//
//  Created by Lê Công Minh on 08/03/2022.
//

import UIKit

class TableCell: UITableViewCell {

    @IBOutlet weak var lbAPI: UILabel!
    @IBOutlet weak var lbDescription: UILabel!
    @IBOutlet weak var lbAuth: UILabel!
    @IBOutlet weak var lbHTTPs: UILabel!
    @IBOutlet weak var lbCors: UILabel!
    @IBOutlet weak var lbLink: UILabel!
    @IBOutlet weak var lbCategory: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
