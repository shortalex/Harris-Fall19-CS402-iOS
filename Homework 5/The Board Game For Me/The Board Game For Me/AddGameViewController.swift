//
//  AddGameViewController.swift
//  The Board Game For Me
//
//  Created by Alex Harris on 10/29/19.
//  Copyright © 2019 Crap Apps. All rights reserved.
//

import UIKit
import CoreData

class AddGameViewController: UIViewController {

//    @IBOutlet weak var gameName: UITextField!
//
//    @IBOutlet weak var gameComment: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
                
//            let newGame = GameList(context: context)
//            newGame.gameName = "Another crag location"
//            newGame.personalComments = "new notes go here"
//        //
//        //        newCrag.cragLocation = ClimbingLocation(context: context)
//        //        newCrag.cragLocation?.latitude = 123.54
//        //        newCrag.cragLocation?.longitude = 321.985
//        //
//            DatabaseController.saveContext()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func Add(_ sender: Any) {
        
        
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func Cancel(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
