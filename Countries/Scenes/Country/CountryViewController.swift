//
//  CountryViewController.swift
//  Countries
//
//  Created by omari katamadze on 19.12.22.
//

import UIKit
import Kingfisher
class CountryViewController: UIViewController {

    
    
    @IBOutlet weak var imagViewpng: UIImageView!
    @IBOutlet weak var imageViewFlag: UIImageView!
    var _population : Int = 0
    var _coutryName : String = ""
    var _cca2 : String = ""
    var _region : String = ""
    var _capital : String = ""
    var _coatOfArms : String = ""
    var _flag : String = ""
    
    @IBOutlet weak var population: UILabel!
    @IBOutlet weak var cca2: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var coutryName: UILabel!
    @IBOutlet weak var capital: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        population.text = String(_population)
        region.text = _region
        cca2.text = _cca2
        coutryName.text = _coutryName
        capital.text = _capital
        
     //   guard let  myurl : String = _coatOfArms else { return }
        let url = URL(string: _coatOfArms)
        imagViewpng.kf.setImage(with: url)
        imagViewpng.kf.indicatorType = .activity
        
        imageViewFlag.kf.indicatorType = .activity
        let flagUrl = URL(string: _flag)
        imageViewFlag.kf.setImage(with: flagUrl)
       
        
      
    }
    

 

}
