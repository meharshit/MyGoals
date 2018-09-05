//
//  FinishGoalVC.swift
//  MyGoals
//
//  Created by Harshit Satyaseel on 02/09/18.
//  Copyright © 2018 Harshit Satyaseel. All rights reserved.
//

import UIKit
import CoreData

class FinishGoalVC: UIViewController,UITextFieldDelegate {
    @IBOutlet weak var createGoalOutlet: UIButton!
    @IBOutlet weak var pointsTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createGoalOutlet.adjustNextButto()
        pointsTextField.delegate = self
    }
    
    var goalDescription: String!
    var goalType: GoalType!
    
    func initData(description: String, type: GoalType){
        self.goalDescription = description
        self.goalType = type
    }

    @IBAction func finishBackButtonVcWhenPressed(_ sender: Any) {
       dismissDetail()
    }
    
    
    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        
        // when pressed pass the data in the core data model.
        
        if pointsTextField.text != ""{  // checks first that we have entered some value in the points or complete value time.
            self.save { (complete) in
                if complete{
                    dismiss(animated: true, completion: nil)
                }
            }
        }
        
    }
    
    
    //MARK: - Saving to core data
    //completion handler for saving the data into the core data manage object context
    
    func save(completion:(_ finished: Bool)-> ()){
        
        // STEP1st : setup the model
        // code for getting the managed object context from the main queue
        guard let managedContext =  appDelegate?.persistentContainer.viewContext else{
            return
        }
        // created instance of goal and given to the managed context
        let goal = Goal(context: managedContext)
        goal.goalDescription = goalDescription
        goal.goalType = goalType.rawValue // pull out the raw value always to access that
        // core data doesnot accept the type as a type so .rawvalue is used.
        goal.goalCompleted = Int32(pointsTextField.text!)!
        goal.completionValue = Int32(0)
        

        // STEP2:- pass the data from the managed context obejct to presistence storage.
        do{
            try managedContext.save()
            // if saves then
            completion(true)
            //print("sucessful in saving data")
        } catch{
            debugPrint("error is: \(error.localizedDescription)")
            // if not
            completion(false)
        }
        
    }
    
}
