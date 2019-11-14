//
//  ViewController.swift
//  The Board Game For Me
//
//  Created by Alex Harris on 10/28/19.
//  Copyright © 2019 Crap Apps. All rights reserved.
//

import UIKit
import CoreData


class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var fetchResults:[GameList] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let context = DatabaseController.persistentStoreContainer().viewContext
        
        let newGame = GameList(context: context)
//        newGame.gameName = "Another crag location"
//        newGame.personalComments = "new notes go here"
//
//        newCrag.cragLocation = ClimbingLocation(context: context)
//        newCrag.cragLocation?.latitude = 123.54
//        newCrag.cragLocation?.longitude = 321.985
//
        DatabaseController.saveContext()
        
        
        let fetchRequest:NSFetchRequest = GameList.fetchRequest()
        
        do{
            fetchResults = try context.fetch(fetchRequest)
        }
        catch{
            print(error)
        }
        
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GameListCell")
        
        cell?.textLabel?.text = fetchResults[indexPath.row].gameName
        
        return cell!
    }
}

