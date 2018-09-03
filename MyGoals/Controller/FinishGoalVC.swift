//
//  FinishGoalVC.swift
//  MyGoals
//
//  Created by Harshit Satyaseel on 02/09/18.
//  Copyright © 2018 Harshit Satyaseel. All rights reserved.
//

import UIKit

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

  
    @IBAction func createGoalBtnWasPressed(_ sender: Any) {
        
        // when pressed pass the data in the core data model.
    }
    
}
