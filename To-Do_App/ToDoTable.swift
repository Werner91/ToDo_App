//
//  ToDoTable.swift
//  To-Do_App
//
//  Created by Werner on 30.12.15.
//  Copyright (c) 2015 Werner. All rights reserved.
//

import UIKit
import CoreData

class ToDoTable: UITableViewController {
    
    
    @IBOutlet var tableview_todo: UITableView!
    
    let context = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext;
    var daten = [ToDo]();

    override func viewDidAppear(animated: Bool) {
        loadData();
        println("view Did appear");
    }
    
    
    func loadData(){
        
        //var appDel:AppDelegate = (UIApplication.sharedApplication().delegate as! AppDelegate);
        //var context:NSManagedObjectContext! = appDel.managedObjectContext;
        
        
        var request = NSFetchRequest(entityName: "ToDo");
        //request.returnsObjectsAsFaults = false;
        
        daten = context!.executeFetchRequest(request, error: nil) as! [ToDo];
        
        tableView.reloadData();
        if daten.count > 0 {
            //var res = daten[0] as! NSManagedObject;
        
            println("es wurden daten geladen, ausgabe beim laden:");
            println(daten.count);
        }else{
            println("keine Daten");
        }

        tableView.reloadData();
        
        
        
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData();
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return daten.count;
    }
    
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        cell.textLabel?.text = "\(daten[indexPath.row].todo_title)";
        return cell;
    }
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
       
        if(segue.identifier == "segue_show_todo"){
            (segue.destinationViewController as! ShowToDo).todo_item = daten[tableView.indexPathForCell(sender as! UITableViewCell)!.row];
        }
    }
    
    
    
    
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true;
    }
    

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            context!.deleteObject(daten[indexPath.row]);
            context!.save(nil);
            let fetchRequest = NSFetchRequest(entityName: "ToDo");
            daten = context!.executeFetchRequest(fetchRequest, error: nil) as! [ToDo];
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        
        }
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
