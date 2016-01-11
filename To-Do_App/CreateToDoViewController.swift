//
//  CreateToDoViewController.swift
//  To-Do_App
//
//  Created by Werner on 30.12.15.
//  Copyright (c) 2015 Werner. All rights reserved.
//

import UIKit
import CoreData


class CreateToDoViewController: UIViewController {
    
    
    
    @IBOutlet weak var title_txf: UITextField!
    @IBOutlet weak var description_txf: UITextField!
    @IBOutlet weak var date_pkr: UIDatePicker!
    
    
    
    @IBAction func save_btn(sender: AnyObject) {
        
        if(title_txf.text == ""){
            let alertController = UIAlertController(title: "ERROR", message: "Title is missing", preferredStyle: .Alert);
            alertController.addAction(UIAlertAction(title: "Ok", style: .Cancel, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil);
        }else{
            println("saved \(title_txf.text) \(description_txf.text) \(date_pkr.date)");
        
            var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate);
            var context:NSManagedObjectContext! = appDel.managedObjectContext;
            
            var todo_item = NSEntityDescription.insertNewObjectForEntityForName("ToDo", inManagedObjectContext: context) as! NSManagedObject;
        
            todo_item.setValue("" + "\(title_txf.text)", forKey: "todo_title");
            todo_item.setValue("" + "\(description_txf.text)", forKey: "todo_description");
            todo_item.setValue(date_pkr.date, forKey: "todo_date");
            
            context.save(nil);
            
            println(todo_item);
            
            title_txf.text = "";
            description_txf.text = "";
        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
