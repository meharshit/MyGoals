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
    
    // function to pass proper data when we actually begin or fill data from our coreData model.
    
    func ConfigureCell(description: String, type: GoalType, goalProgress: Int){
        
        self.goalDescription.text = description
        self.goalType.text = type.rawValue
        self.goalProgressLbl.text = String(describing:goalProgress) // when we pass a int value in tableview do this way
        
        
        
    }
    
}
