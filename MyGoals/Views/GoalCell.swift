//
//  GoalCell.swift
//  MyGoals
//
//  Created by Harshit Satyaseel on 30/08/18.
//  Copyright © 2018 Harshit Satyaseel. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    
    @IBOutlet weak var goalDescription: UILabel!
    @IBOutlet weak var goalType: UILabel!
    @IBOutlet weak var goalProgressLbl: UILabel!
    @IBOutlet weak var completionView: UIView!
    
    // function to pass proper data when we actually begin or fill data from our coreData model.
    
    func ConfigureCell(goal: Goal){
        
        self.goalDescription.text = goal.goalDescription
        self.goalType.text = goal.goalType
        self.goalProgressLbl.text = String(describing: goal.completionValue) // when we pass a int value in tableview do this way
        
        if goal.completionValue == goal.goalCompleted{
            self.completionView.isHidden = false
        }else{
            self.completionView.isHidden = true
        }
        
    }
    
}
