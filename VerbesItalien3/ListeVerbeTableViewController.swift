//
//  ListeVerbeTableViewController.swift
//  VerbesItalien3
//
//  Created by Normand Martin on 15-11-08.
//  Copyright © 2015 Normand Martin. All rights reserved.
//

import UIKit

var verbeInfinitif: [String] = []
var tempsVerbes: [String] = []
var personneVerbes: [String] = []
var alphaVerbeInfinitif: [String] = []


class ListeVerbeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let plistPath = NSBundle.mainBundle().pathForResource("ItalianVerbPlist", ofType: "plist"),
            let verbeDictionary = NSDictionary(contentsOfFile: plistPath){
                
                let listeDeVerbe = ListedeVerbe(verbeDictionary: verbeDictionary)
                
                verbeInfinitif = listeDeVerbe.infinitif
                tempsVerbes = listeDeVerbe.tempsVerbe
                personneVerbes = listeDeVerbe.personneVerbe
                func alpha (s1: String, s2: String) -> Bool {
                    return s1 < s2
                }
                alphaVerbeInfinitif = verbeInfinitif.sort(alpha)
                
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    // Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showTempsVerbe"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let verbeChoisi = alphaVerbeInfinitif[indexPath.row]
                
                let controller = segue.destinationViewController as! DetailViewController
                controller.detailItem = verbeChoisi
            }
            
            
        }
    
    }
    
    

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return alphaVerbeInfinitif.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Verbe", forIndexPath: indexPath)
        
        let verbeNonConjugue = alphaVerbeInfinitif[indexPath.row]
        cell.textLabel!.text = verbeNonConjugue
        return cell
    }
}
