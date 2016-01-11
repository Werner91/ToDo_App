//
//  ShowToDo.swift
//  To-Do_App
//
//  Created by Werner on 30.12.15.
//  Copyright (c) 2015 Werner. All rights reserved.
//

import UIKit

class ShowToDo: UIViewController {

    
    @IBOutlet weak var show_todo_title: UILabel!
    @IBOutlet weak var show_todo_description: UILabel!
    @IBOutlet weak var show_todo_date: UILabel!
    
    var todo_item: ToDo?;
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        show_todo_title.text = "\(todo_item!.todo_title)";
        show_todo_description.text = "\(todo_item!.todo_description)";
        show_todo_date.text = "\(todo_item!.todo_date)";
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if(segue.identifier == "segue_edit_todo"){
            let nav = segue.destinationViewController as! UINavigationController;
            let evc = nav.topViewController as! EditToDo;
            
            evc.todo_edit_item = todo_item!;
            //evc.date_text = show_todo_date.text!;
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
