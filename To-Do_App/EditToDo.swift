//
//  EditToDo.swift
//  To-Do_App
//
//  Created by Werner on 01.01.16.
//  Copyright (c) 2016 Werner. All rights reserved.
//

import UIKit
import CoreData

class EditToDo: UIViewController {

    @IBOutlet weak var edit_title_todo: UITextField!
    @IBOutlet weak var edit_description_todo: UITextField!
    @IBOutlet weak var edit_date_todo: UIDatePicker!

    
    var todo_edit_item: ToDo?;
    
    override func viewDidLoad() {
        super.viewDidLoad()
         // Do any additional setup after loading the view.
        edit_title_todo.text = "\(todo_edit_item!.todo_title)";
        edit_description_todo.text = "\(todo_edit_item!.todo_description)";
        edit_date_todo.date = todo_edit_item!.todo_date;

       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        todo_edit_item?.todo_title = edit_title_todo.text;
        todo_edit_item?.todo_description = edit_description_todo.text;
        todo_edit_item?.todo_date = edit_date_todo.date;
        
        if(segue.identifier == "segue_show_todo_afteredit"){
            /*
            var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate);
            var context:NSManagedObjectContext! = appDel.managedObjectContext;
            
            var todo_item = NSEntityDescription("ToDo", inManagedObjectContext: context) as! NSManagedObject;
            
            daten[tableView.indexPathForCell(sender as! UITableViewCell)!.row];
            */
            
            
            let nav = segue.destinationViewController as! UINavigationController;
            let evc = nav.topViewController as! ShowToDo;
            
            evc.todo_item = todo_edit_item!;
        }
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
