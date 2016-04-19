//
//  LeVerbeFinalViewController.swift
//  VerbesItalien3
//
//  Created by Normand Martin on 16-02-16.
//  Copyright © 2016 Normand Martin. All rights reserved.
//

import UIKit



class LeVerbeFinalViewController: UIViewController {
    

    @IBOutlet weak var verbeMode: UILabel!
    @IBOutlet weak var verbeTemps: UILabel!
    @IBOutlet weak var pronom1: UILabel!
    @IBOutlet weak var pronom2: UILabel!
    @IBOutlet weak var pronom4: UILabel!
    @IBOutlet weak var pronom3: UILabel!
    @IBOutlet weak var pronom5: UILabel!
    @IBOutlet weak var pronom6: UILabel!
    @IBOutlet weak var verbe1: UILabel!
    @IBOutlet weak var verbe2: UILabel!
    @IBOutlet weak var verbe3: UILabel!
    @IBOutlet weak var verbe4: UILabel!
    @IBOutlet weak var verbe5: UILabel!
    @IBOutlet weak var verbe6: UILabel!
    
    
    
    
    
    
    var selectionVerbe = ["", "", ""]

    override func viewDidLoad() {
        super.viewDidLoad()
        verbeMode.text = selectionVerbe[1]
        verbeTemps.text = selectionVerbe[2]
        let temps = selectionVerbe[1] + " " + selectionVerbe[2]
        let infinitif = selectionVerbe[0]
        if let plistPath = NSBundle.mainBundle().pathForResource("ItalianVerbPlist", ofType: "plist"),
            let verbeDictionary = NSDictionary(contentsOfFile: plistPath){

                
                self.title = selectionVerbe[0]
                if selectionVerbe[1] == "Congiuntivo" {
                    pronom1.text = "che io"
                    pronom2.text = "che tu"
                    pronom3.text = "che lui, lei"
                    pronom4.text = "che noi"
                    pronom5.text = "che voi"
                    pronom6.text = "che loro"
                    verbe1.text = verbeDictionary["verbe"]?[infinitif]??[temps]??["io"] as? String
                    verbe2.text = verbeDictionary["verbe"]![infinitif]!![temps]!!["tu"] as? String
                    verbe3.text = verbeDictionary["verbe"]![infinitif]!![temps]!!["lui, lei"] as? String
                    verbe4.text = verbeDictionary["verbe"]![infinitif]!![temps]!!["noi"] as? String
                    verbe5.text = verbeDictionary["verbe"]![infinitif]!![temps]!!["voi"] as? String
                    verbe6.text = verbeDictionary["verbe"]![infinitif]!![temps]!!["loro"] as? String
                    
                }else if selectionVerbe[1] == "Imperativo"{
                    pronom1.text = ""
                    pronom2.text = ""
                    pronom3.text = ""
                    pronom4.text = ""
                    pronom5.text = ""
                    pronom6.text = ""
                    verbe1.text = ""
                    verbe2.text = verbeDictionary["verbe"]![infinitif]!![temps]!!["tu"] as? String
                    verbe3.text = verbeDictionary["verbe"]![infinitif]!![temps]!!["lui, lei"] as? String
                    verbe4.text = verbeDictionary["verbe"]![infinitif]!![temps]!!["noi"] as? String
                    verbe5.text = verbeDictionary["verbe"]![infinitif]!![temps]!!["voi"] as? String
                    verbe6.text = verbeDictionary["verbe"]![infinitif]!![temps]!!["loro"] as? String
                }else{
                    
                    verbe1.text = verbeDictionary["verbe"]?[infinitif]??[temps]??["io"] as? String
                    verbe2.text = verbeDictionary["verbe"]![infinitif]!![temps]!!["tu"] as? String
                    verbe3.text = verbeDictionary["verbe"]![infinitif]!![temps]!!["lui, lei"] as? String
                    verbe4.text = verbeDictionary["verbe"]![infinitif]!![temps]!!["noi"] as? String
                    verbe5.text = verbeDictionary["verbe"]![infinitif]!![temps]!!["voi"] as? String
                    verbe6.text = verbeDictionary["verbe"]![infinitif]!![temps]!!["loro"] as? String
                }
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
