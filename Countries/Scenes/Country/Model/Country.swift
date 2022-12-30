//
//  Country.swift
//  Countries
//
//  Created by omari katamadze on 18.12.22.
//

import Foundation
struct Country : Codable{
   let name : Name
    let cca2 : String
    let capital : [String]?
    let region : String
    let population : Int
   let flags : Flag
  let coatOfArms : CoatOfArm
    
    enum CodingKeys: String, CodingKey {
        
        case  name
        case capital
        case cca2
        case population
        case region
        case flags
        case coatOfArms
      }
}

struct Name : Codable{
let common : String
let official : String
    
 enum CodingKeys: String, CodingKey {
    case common
    case official
       
      }
}


struct Flag : Codable{
    let png : String?
    let svg : String?
    enum CodingKeys: String, CodingKey {
         case png
         case svg
       
      }
}

struct CoatOfArm : Codable{
    let png : String? 
    let svg : String?
    enum CodingKeys: String, CodingKey {
         case png
         case svg
       
      }
}
