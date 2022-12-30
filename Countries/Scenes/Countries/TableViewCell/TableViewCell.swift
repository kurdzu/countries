//
//  TableViewCell.swift
//  Countries
//
//  Created by omari katamadze on 18.12.22.
//

import UIKit
import Kingfisher
class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageFlag: UIImageView!
    @IBOutlet weak var lbCountryName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(with country : Country){
        lbCountryName.text = country.name.common
     //   let image = UIImage(data: country.flags.png)
        guard let myurl = country.flags.png else { return }
        let url = URL(string: myurl)
        imageFlag.kf.setImage(with: url)
        imageFlag.kf.indicatorType = .activity
       
    }
    func setupUI() {
     
    }
}
