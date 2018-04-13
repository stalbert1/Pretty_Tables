//
//  Receipt.swift
//  Pretty_Tables
//
//  Created by Shane Talbert on 3/22/18.
//  Copyright © 2018 Shane Talbert. All rights reserved.
//

import UIKit

class Receipt {
    
    //deleted sub class of NSObject
    private var _note : String
    private var _date : Date
    private var _isVerified : Bool
    private var _creditCard : String
    
    //Need an array of stored credit cards.  Can build the array by reading all reciepts and building the list on the fly?
    
    init(note: String, creditCard: String) {
        self._note = note
        self._isVerified = false
        self._creditCard = creditCard
        
        //want to capture the date as the date pic was taken
        _date = Date()
        
    }
    
    var note: String {
        get {
            return _note
        }
    }
    
    //return date as string
    var date: String {
        
        let myFormat = DateFormatter()
        myFormat.dateStyle = .medium
        myFormat.timeStyle = .none
        return myFormat.string(from: _date)
        
    }
    
    var isVerified: String {
        if _isVerified == true {
            return "Is Verified"
        } else {
            return "Not Verified"
        }
    }
    
    var creditCard: String {
        get {
            return _creditCard
        }
    }
    
    var information: String {
        get {
            let receiptInfo = ("\(_creditCard) card \(_note)")
            return receiptInfo
        }
    }
    

}
