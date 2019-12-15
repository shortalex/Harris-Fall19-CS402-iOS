//
//  AddGamesViewController.swift
//  The Board Game For Me
//
//  Created by Alex Harris on 11/13/19.
//  Copyright © 2019 Crap Apps. All rights reserved.
//

import UIKit

class AddGamesViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addButton(_ sender: Any) {
    }
    
    @IBAction func cancelButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
     @IBAction func cancelButton(_ sender: Any) {
     }
     // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
