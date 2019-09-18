//
//  ViewController.swift
//  Calculator
//
//  Created by Alex Harris on 9/8/19.
//  Copyright © 2019 Alex Harris. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var textBox1: UITextField!
    
    @IBOutlet weak var textBox2: UITextField!
    
    @IBOutlet weak var output: UILabel!
    
    @IBOutlet weak var history: UILabel!
    
    var logArray = UserLogController.loggingList()
    
    var programmaticLabel:UILabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func add(_ sender: Any) {
        if (textBox1.text!.isEmpty || textBox2.text!.isEmpty){
            output.text = "Error: Needs 2 inputs."
        }
        else{
            var outputString =
                String(Double(textBox1.text!)! + Double(textBox2.text!)!)
            output.text = outputString
            print(output!)
            
            let historyString = "\(outputString)"
            logArray.append(historyString)
            history.text = logArray.joined(separator: ",")
            print(logArray)
            print(UserLogController.loggingList())
            UserLogController.logNewEvent(newEventToLog: historyString)
            
        }
    }
    
    @IBAction func subtract(_ sender: Any) {
        if (textBox1.text!.isEmpty || textBox2.text!.isEmpty){
            output.text = "Error: Needs 2 inputs."
        }
        else{
            var outputString =
                String(Double(textBox1.text!)! - Double(textBox2.text!)!)
            output.text = outputString
            print(output!)
            
            let historyString = "\(outputString)"
            logArray.append(historyString)
            history.text = logArray.joined(separator: ",")
            print(logArray)
            print(UserLogController.loggingList())
            UserLogController.logNewEvent(newEventToLog: historyString)
        }
    }
    
    @IBAction func multiple(_ sender: Any) {
        if (textBox1.text!.isEmpty || textBox2.text!.isEmpty){
            output.text = "Error: Needs 2 inputs."
        }
        else{
            var outputString =
                String(Double(textBox1.text!)! * Double(textBox2.text!)!)
            output.text = outputString
            print(output!)
            
            let historyString = "\(outputString)"
            logArray.append(historyString)
            history.text = logArray.joined(separator: ",")
            print(logArray)
            print(UserLogController.loggingList())
            UserLogController.logNewEvent(newEventToLog: historyString)
        
   //         ViewController.historyFunc()
        }
    }
    
    @IBAction func divide(_ sender: Any) {
        if (textBox1.text!.isEmpty || textBox2.text!.isEmpty){
            output.text = "Error: Needs 2 inputs."
        }
        else{
            if (textBox2.text!.isEqual("0")){
                output.text = "Error: Divide by 0"
            }
            else{
                var outputString =
                    String(Double(textBox1.text!)! / Double(textBox2.text!)!)
                output.text = outputString
                print(output!)
                
                let historyString = "\(outputString)"
                logArray.append(historyString)
                history.text = logArray.joined(separator: ",")
                print(logArray)
                print(UserLogController.loggingList())
                UserLogController.logNewEvent(newEventToLog: historyString)
            }
        }
       
        
    }
    
}

