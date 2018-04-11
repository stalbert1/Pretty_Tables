//
//  ReceiptStore.swift
//  Pretty_Tables
//
//  Created by Shane Talbert on 3/22/18.
//  Copyright © 2018 Shane Talbert. All rights reserved.
//

import Foundation

class ReceiptStore {
    
    //storage for database of reciepts
    var receipts = [Receipt]()
    
    //used to create some random entries
    private var creditCards = ["Chase Visa", "Prime Visa", "Chk debit", "Gap Visa"]
    
//    init() {
//    }
    
    private func createRandCard () -> String {
        let rndIndex = Int(arc4random_uniform(UInt32(creditCards.count)))
        return creditCards[rndIndex]
    }
    
    func createRandomReceipts () -> [Receipt] {
        
        receipts.append(Receipt(note: "Best Buy bought a TV", creditCard: createRandCard()))
        receipts.append(Receipt(note: "Los Tacos Tuesday", creditCard: createRandCard()))
        receipts.append(Receipt(note: "TJ Max 10.56", creditCard: createRandCard()))
        receipts.append(Receipt(note: "Home Depot Carpet", creditCard: createRandCard()))
        receipts.append(Receipt(note: "Lowes well pump 262.56", creditCard: createRandCard()))
        receipts.append(Receipt(note: "UA shirt", creditCard: createRandCard()))
        receipts.append(Receipt(note: "Nike shoes 56.90", creditCard: createRandCard()))
        receipts.append(Receipt(note: "Papa Johns pizza pie", creditCard: createRandCard()))
        receipts.append(Receipt(note: "Little Ceaser Pizza pizza", creditCard: createRandCard()))
        receipts.append(Receipt(note: "Ikea office stuff", creditCard: createRandCard()))
        receipts.append(Receipt(note: "Little Ceaser Pizza pizza", creditCard: createRandCard()))
        return receipts
    }
    
}
