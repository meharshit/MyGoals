//
//  GoalsVC.swift
//  MyGoals
//
//  Created by Harshit Satyaseel on 30/08/18.
//  Copyright © 2018 Harshit Satyaseel. All rights reserved.
//

import UIKit
import CoreData

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

    
    @IBOutlet weak var goalButtonWasPressed: UIButton!
    
}


extension GoalsVC : UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // for static
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // create cell and configure the data for reusability.
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "goalCell") as? GoalCell else{
            return UITableViewCell()
        }
        cell.ConfigureCell(description: "run run run", type: .longTerm, goalProgress: 2)
        return cell
    }



}
