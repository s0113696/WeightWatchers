//
//  ViewController.swift
//  WeightWatchers
//
//  Created by cis290 on 11/28/16.
//  Copyright © 2016 Rock Valley College. All rights reserved.
//

import UIKit

//0) Add import for CoreData
import CoreData

class ViewController: UIViewController {
    
    var endtotals:Double = 0.0
    
    @IBOutlet weak var todaysdate: UITextField!
    
    @IBOutlet weak var status: UILabel!
    
    @IBAction func btnBack(sender: UIBarButtonItem) {
        //**Begin Copy**
        self.dismissViewControllerAnimated(false, completion: nil)
        //**End Copy**
    }
    
    @IBOutlet weak var startnumber: UITextField!
    
    @IBOutlet weak var breakfast: UITextField!
    
    @IBOutlet weak var snack1: UITextField!
    
    @IBOutlet weak var lunch: UITextField!
    
    @IBOutlet weak var snack2: UITextField!
    
    @IBOutlet weak var dinner: UITextField!
    
    @IBOutlet weak var snack3: UITextField!
    
    @IBOutlet weak var endtotal: UITextField!
    
    @IBOutlet weak var btnSave: UIButton!
    
    
    //3) Add ManagedObject Data Context
    
    //**Begin Copy**
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    //**End Copy**
    
    //4) Add variable contactdb (used from UITableView
    
    //**Begin Copy**
    var contactdb:NSManagedObject!
    
    @IBAction func btnSave(sender: UIButton) {
        //1 Add Save Logic
        
        //**Begin Copy**
        if (contactdb != nil)
        {
            //contactdb.setValue(todaysdate.text, forKey: "todaysdate")
           // contactdb.setValue(startnumber.text, forKey: "startpoints")
             contactdb.setValue(Double(breakfast.text!), forKey: "breakfast")
             contactdb.setValue(Double(snack1.text!), forKey: "snack1")
             contactdb.setValue(Double(lunch.text!), forKey: "lunch")
             contactdb.setValue(Double(snack2.text!), forKey: "snack2")
             contactdb.setValue(Double(dinner.text!), forKey: "dinner")
             contactdb.setValue(Double(snack3.text!), forKey: "snack3")
             calc()
             contactdb.setValue(endtotals, forKey: "endpoints")
            
        }
        else
        {
            let entityDescription =
                NSEntityDescription.entityForName("MyLog",inManagedObjectContext: managedObjectContext)
            
            let contact = MyLog(entity: entityDescription!,
                                  insertIntoManagedObjectContext: managedObjectContext)
            
            contact.startpoints = Double(startnumber.text!)
            contact.breakfast = Double(breakfast.text!)
            contact.snack1 = Double(snack1.text!)
            contact.lunch = Double(lunch.text!)
            contact.snack2 = Double(snack2.text!)
            contact.dinner = Double(dinner.text!)
            contact.snack3 = Double(snack3.text!)
            calc()
            contact.endpoints = endtotals
            let date = NSDate()
            let formatter = NSDateFormatter()
            formatter.timeStyle = .ShortStyle
            formatter.dateStyle = .ShortStyle
            let stringdate = formatter.stringFromDate(date)
            let nowdate = formatter.dateFromString(stringdate)
            //print(formatter.stringFromDate(date))
            contact.todaysdate = nowdate
            
        }
        var error: NSError?
        do {
            try managedObjectContext.save()
        } catch let error1 as NSError {
            error = error1
        }
        
        if let err = error {
            status.text = err.localizedFailureReason
        } else {
            self.dismissViewControllerAnimated(false, completion: nil)
            
        }
        //**End Copy**
        
    }
    func calc()
    {
        print(startnumber.text!)
        var sn = startnumber.text!
        let bk = breakfast.text!
        let s1 = snack1.text!
        let ln = lunch.text!
        let s2 = snack2.text!
        let dn = dinner.text!
        let s3 = snack3.text!
        var x =  Double(bk)! + Double(s1)!
        x += Double(ln)!
        x += Double(s2)!
        x += Double(s2)!
        x += Double(dn)!
        x += Double(s3)!
        endtotals = Double(sn)! - x
        
       
        //("\(randomNumber)" - "\(secondRandomNumber)")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
         let defaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        if (defaults.objectForKey("dailypoints") as? String) != nil {
            self.startnumber.text = defaults.objectForKey("dailypoints") as? String
        }
        //**Begin Copy**
        if (contactdb != nil)
        {
//            print(contactdb.valueForKey("breakfast") as! Double)
            todaysdate.text = String(contactdb.valueForKey("todaysdate") as! NSDate)
            startnumber.text = String(contactdb.valueForKey("startpoints") as! Double)
            breakfast.text = String(contactdb.valueForKey("breakfast") as! Double)
            snack1.text = String(contactdb.valueForKey("snack1") as! Double)
            lunch.text = String(contactdb.valueForKey("lunch") as! Double)
            snack2.text = String(contactdb.valueForKey("snack2") as! Double)
            dinner.text = String(contactdb.valueForKey("dinner") as! Double)
            snack3.text = String(contactdb.valueForKey("snack3") as! Double)
            endtotal.text = String(contactdb.valueForKey("endpoints") as! Double)
            btnSave.setTitle("Update", forState: UIControlState.Normal)
        }
        else
        {
            let date = NSDate()
            let formatter = NSDateFormatter()
            formatter.timeStyle = .ShortStyle
            formatter.dateStyle = .ShortStyle
            let stringdate = formatter.stringFromDate(date)
            todaysdate.text = stringdate
        }
        breakfast.becomeFirstResponder()
        // Do any additional setup after loading the view.
        //Looks for single or multiple taps
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.DismissKeyboard))
        //Adds tap gesture to view
        view.addGestureRecognizer(tap)
        
        
        // Do any additional setup after loading the view, typically from a nib.
        
        //**End Copy**

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //6 Add to hide keyboard
    
    //**Begin Copy**
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        super.touchesBegan(touches , withEvent:event)
        if (touches.first as UITouch!) != nil {
            DismissKeyboard()
        }
    }
    //**End Copy**
    
    //7 Add to hide keyboard
    
    //**Begin Copy**
    func DismissKeyboard(){
        //forces resign first responder and hides keyboard
        breakfast.endEditing(true)
        snack1.endEditing(true)
        lunch.endEditing(true)
         snack2.endEditing(true)
         dinner.endEditing(true)
        snack3.endEditing(true)
     
        
    }
    //**End Copy**
    
    //8 Add to hide keyboard
    
    //**Begin Copy**
    func textFieldShouldReturn(textField: UITextField!) -> Bool     {
        textField.resignFirstResponder()
        return true;
    }
    //**End Copy**
    
}

