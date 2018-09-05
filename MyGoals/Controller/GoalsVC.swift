//
//  GoalsVC.swift
//  MyGoals
//
//  Created by Harshit Satyaseel on 30/08/18.
//  Copyright © 2018 Harshit Satyaseel. All rights reserved.
//

import UIKit
import CoreData
// globle to all VC variable

let appDelegate = UIApplication.shared.delegate as? AppDelegate

var goals: [Goal] = []

class GoalsVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setting up core data attribute just for example
        // let goal = Goal() // this is an instance of the core data model
        
        // setting up the delegate and datasource for the tableview.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isHidden = false

    }
    
    // relode data in viewWillAppear since it lodes every times unlike viewdid load that only lodes ones.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchDataobjects()
        tableView.reloadData()
    }
    // function to fetch dataObjects
    func fetchDataobjects(){
        self.fetch { (complete) in
            if complete{
                if goals.count >= 1{
                    tableView.isHidden = false
                }else{
                    tableView.isHidden = true
                }
            }
        }
    }

    
    @IBAction func addGoalButtonWasPressed(_ sender: Any) {
        // move to next view controller
        guard let viewController = storyboard?.instantiateViewController(withIdentifier: "createGoalVC") else{
            return
        }
        presentDetail(viewController)
    }
}

// MARK:-  extension for the tableview functions
extension GoalsVC : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // for static
        return goals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create cell and configure the data for reusability.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else{
            return UITableViewCell()
        }
        // now display as array of Goal type
        let goal = goals[indexPath.row]
        cell.ConfigureCell(goal: goal)
        return cell
    }
    
    // to enable swapping of table view we have the following delegate
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // setting the editing style of the tableview
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        
        return .none // none because we have our custom style of editing
    }
    
    // function for editing actions
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
//MARK:-  we will create 2 actions delete and add
        
        
        // Step1 this is for delete action:-
        let deleteAction = UITableViewRowAction(style: .destructive, title: "DELETE") { (rowAction, indexPath ) in
            // logic for the delete button
            // romoveed by
            self.removeGoals(atIndexpath: indexPath)
            
            // Now fetch the data from our core data model and update our tableView so,
            self.fetchDataobjects()
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    
        // Step 2 add action on the tableView
        let addAction = UITableViewRowAction(style: .normal, title: "ADD 1") { (rowAction, indexPath) in
            self.setProgress(atIndexPath: indexPath)
            tableView.reloadRows(at: [indexPath], with: .automatic)
        }
         // setting the background color of the actions
        deleteAction.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        addAction.backgroundColor = #colorLiteral(red: 1, green: 0.7058823529, blue: 0, alpha: 1)
        
        // return the actions
        return [deleteAction,addAction] // since the function excepts an array
    
    }
    
}



// MARK: -  functions that will fetch data from the presistence store and display that on the tableview.
extension GoalsVC{
    // function to fetch data from the core data that is the presistence store
    func fetch(completion: (_ complete: Bool) -> ()){
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{return}
        // creating a fetch request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Goal")
        do{
            goals = try managedContext.fetch(fetchRequest) as! [Goal]
            print("sucess")
            completion(true)
        }
        catch{
            debugPrint("error is \(error.localizedDescription)")
            completion(false)
        }
    }
    
    
// MARK:- function to remove that from the presistence store of the core data
    func removeGoals(atIndexpath indexPath: IndexPath){
        
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{return}
        managedContext.delete(goals[indexPath.row])
        // once deleted then try saving i.e updating the presistence store so save it once again for that we need the following
        do{
            try managedContext.save()
            print("sucess")
        }catch{
            debugPrint("error is \(error.localizedDescription)")
        }
    }
    
    // function for the progress lable dispalying the logic
    func setProgress(atIndexPath indexPath: IndexPath){
        guard let managedContext = appDelegate?.persistentContainer.viewContext else{return}
        
        let selectedGoal = goals[indexPath.row]
        
        if selectedGoal.completionValue < selectedGoal.goalCompleted{
            selectedGoal.completionValue += 1
        }else{
            return
        }
        
        do{
            try managedContext.save()
            print("sucess")
        }catch{
            debugPrint("the error is \(error.localizedDescription)")
        }
    }
    
    
}




