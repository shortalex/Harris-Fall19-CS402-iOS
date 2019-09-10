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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func add(_ sender: Any) {
        if (textBox1.text!.isEmpty || textBox2.text!.isEmpty){
            output.text = "Error: Needs 2 inputs."
        }
        else{
            output.text =
                String(Double(textBox1.text!)! + Double(textBox2.text!)!)
        }
    }
    
    @IBAction func subtract(_ sender: Any) {
        if (textBox1.text!.isEmpty || textBox2.text!.isEmpty){
            output.text = "Error: Needs 2 inputs."
        }
        else{
            output.text =
                String(Double(textBox1.text!)! - Double(textBox2.text!)!)
        }
    }
    
    @IBAction func multiple(_ sender: Any) {
        if (textBox1.text!.isEmpty || textBox2.text!.isEmpty){
            output.text = "Error: Needs 2 inputs."
        }
        else{
            output.text =
                String(Double(textBox1.text!)! * Double(textBox2.text!)!)
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
                output.text = String(Double(textBox1.text!)! / Double(textBox2.text!)!)
            }
        }
        
    }
    
}

