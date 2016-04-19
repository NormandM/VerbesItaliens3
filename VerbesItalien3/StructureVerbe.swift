//
//  StructureVerbe.swift
//  VerbesItalien3
//
//  Created by Normand Martin on 15-11-08.
//  Copyright © 2015 Normand Martin. All rights reserved.
//

import Foundation
struct ListedeVerbe {
    
    let infinitif: [String]
    let tempsVerbe: [String]
    let personneVerbe: [String]
    

    init(verbeDictionary: NSDictionary) {
        
        infinitif = verbeDictionary["verbe"]?.allKeys as! [String]
        tempsVerbe = verbeDictionary["verbe"]?["essere"]??.allKeys as! [String]
        personneVerbe = verbeDictionary["verbe"]?["essere"]??["Indicativo Futuro semplice"]??.allKeys as! [String]
    }
    
}