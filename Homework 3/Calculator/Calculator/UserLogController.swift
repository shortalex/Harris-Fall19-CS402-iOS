//
//  UserLogController.swift
//  Calculator
//
//  Created by Alex Harris on 9/12/19.
//  Copyright © 2019 Alex Harris. All rights reserved.
//

import Foundation

class UserLogController: NSObject {
    
    static var loggingArray = Array<String>()
    
    
    class func loggingList() -> Array<String>{
        
        return UserLogController.loggingArray
        
    }
    
    static func logNewEvent(newEventToLog:String){
        UserLogController.loggingArray.append(newEventToLog)
        
            print(UserLogController.loggingArray)
       
    }

}
