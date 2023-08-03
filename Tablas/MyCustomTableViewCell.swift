//
//  MyCustomTableViewCell.swift
//  Tablas
//
//  Created by ios dev lab fi unam on 03/08/23.
//

import UIKit

class MyCustomTableViewCell: UITableViewCell {

    @IBOutlet var numberLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var myImage: UIImageView!
    
    override func awakeFromNib() { //se llama cuando se crea la celda perzonalizada por primera vez
        super.awakeFromNib()
        numberLabel.font = UIFont.boldSystemFont(ofSize: 20)
        numberLabel.textColor = .blue
        countryLabel.numberOfLines = 0
        backgroundColor = .cyan
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        print(numberLabel.text ?? "")
    }
    
}
