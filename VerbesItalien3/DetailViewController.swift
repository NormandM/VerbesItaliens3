//
//  ViewController.swift
//  VerbesItalien3
//
//  Created by Normand Martin on 15-11-08.
//  Copyright © 2015 Normand Martin. All rights reserved.
//

import UIKit

let sectionListe = ["INDICATIVO", "CONGIUNTIVO", "CONDIZIONALE", "IMPERATIVO"]
let item = [["Presente", "Imperfetto", "Passato prossimo", "Futuro semplice", "Passato remoto", "Trapassato prossimo", "Trapassato remoto", "Futuro anteriore"], ["Presente", "Imperfetto", "Passato", "Trapassato"], ["Presente", "Passato"], ["Presente"]]

class DetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    let sectionListe = ["INDICATIVO", "CONGIUNTIVO", "CONDIZIONALE", "IMPERATIVO"]
    let item = [["Presente", "Imperfetto", "Passato prossimo", "Futuro semplice", "Passato remoto", "Trapassato prossimo", "Trapassato remoto", "Futuro anteriore"], ["Presente", "Imperfetto", "Passato", "Trapassato"], ["Presente", "Passato"], ["Presente"]]
    
    @IBOutlet weak var verbeInfinitifLabel: UILabel!
    var labelTextTemps: String = ""
    var labelTextInfinitif: String = ""
    var nomSection: String = ""
    var textInfinitif: String = ""
    var verbeTotal = ["", "", ""]
    var leTemps: String = ""
    var detailItem: String = ""
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        leTemps = item[indexPath.section][indexPath.row]
        if item[indexPath.section].count == 8{
            nomSection = "Indicativo"
        }else if item[indexPath.section].count == 4 {
            nomSection = "Congiuntivo"
        }else if item[indexPath.section].count == 2{
            nomSection = "Condizionale"
        }else if item[indexPath.section].count == 1{
            nomSection = "Imperativo"
        }
        verbeTotal = [detailItem, nomSection, leTemps ]
        self.performSegueWithIdentifier("showLeVerbeFinal", sender: indexPath)
    }
    
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return sectionListe[section]
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionListe.count
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return item[section].count
        
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("verbCell2")!
        cell.textLabel!.text = self.item[indexPath.section][indexPath.row]
        return cell
    }

    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showLeVerbeFinal" {
            
            
                let controller = segue.destinationViewController as! LeVerbeFinalViewController
                controller.selectionVerbe = verbeTotal

        }
    }
  
    
}

