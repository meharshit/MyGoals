//
//  CreateGoalVCViewController.swift
//  MyGoals
//
//  Created by Harshit Satyaseel on 31/08/18.
//  Copyright © 2018 Harshit Satyaseel. All rights reserved.
//

import UIKit

class CreateGoalVCViewController: UIViewController {

    @IBOutlet weak var goalTextView: UITextView!
    @IBOutlet weak var longTermButtonOutlet: UIButton!
    @IBOutlet weak var shortTermButtonOutlet: UIButton!
    @IBOutlet weak var nextButtonOutlet: UIButton!
    
    // this variable is set as default selected longterm
    var goalType :GoalType = .longTerm
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // call the function to move the button up with the keyboard
        nextButtonOutlet.adjustNextButto()
        
        // set default color for that call the function
        longTermButtonOutlet.selectedColour()
        shortTermButtonOutlet.deSelectedColour()
        nextButtonOutlet.deSelectedColour()

       
    }

   
    @IBAction func goToGoalsVCButton(_ sender: Any) {
        guard let dismissTheController = storyboard?.instantiateViewController(withIdentifier: "goalVC")else{
            return
        }
        dismissDetail(dismissTheController)
    }
    
    @IBAction func longTermButtonPressed(_ sender: Any) {
        goalType = .longTerm
        longTermButtonOutlet.selectedColour()
        shortTermButtonOutlet.deSelectedColour()
        
    }
    
    
    @IBAction func shortTermButtonPressed(_ sender: Any) {
        goalType = .shortTerm
        shortTermButtonOutlet.selectedColour()
        longTermButtonOutlet.deSelectedColour()
        
    }
    
    @IBAction func nextButtonWasPressed(_ sender: Any) {
        nextButtonOutlet.selectedColour()
    }
    
}
