//
//  MainViewController.swift
//  WeightWatchers
//
//  Created by cis290 on 11/28/16.
//  Copyright © 2016 Rock Valley College. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var TotalNumber: UITextField!
    
    
    @IBAction func btnSave(sender: UIButton) {
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        defaults.setObject(self.TotalNumber.text, forKey: "dailypoints")
        
        defaults.synchronize()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        if (defaults.objectForKey("dailypoints") as? String) != nil {
            self.TotalNumber.text = defaults.objectForKey("dailypoints") as? String
        }

        // Do any additional setup after loading the view.
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
