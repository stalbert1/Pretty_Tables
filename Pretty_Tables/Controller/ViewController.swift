//
//  ViewController.swift
//  Pretty_Tables
//
//  Created by Shane Talbert on 3/19/18.
//  Copyright © 2018 Shane Talbert. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblView: UITableView!
    
    var dbase : ReceiptStore!
    var myReceipts = [Receipt]()
    
    //multi demensional array to store each card in a seperate array
    var mySeperatedReceipts = [[Receipt]]()
    
    //used to create the number of sections in table
    //number of sections would be creditCardNames.count
    var creditCardNames = Set<String>()
    
    var sectionNames = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tblView.dataSource = self
        tblView.delegate = self
        
        //Register the nib file for the custom cell
        let myNib = UINib(nibName: "ReceiptCell", bundle: nil)
        tblView.register(myNib, forCellReuseIdentifier: "customCell")
        
        configureTableView()
        
        //Create some fake receipts
        dbase = ReceiptStore()
        myReceipts = dbase.createRandomReceipts()
        
        //sections in table
        for entry in myReceipts {
            //entry.creditCard this will return a string I think you should form a list which will only count unike entries.
            creditCardNames.insert(entry.creditCard)
        }
        
        for names in creditCardNames {
            sectionNames.append(names)
        }
        
        //initializing the 2d array
        mySeperatedReceipts = Array(repeating: [], count: sectionNames.count)
        
        //build multiple arrays
        for index in 0..<sectionNames.count {
            for thisReceipt in myReceipts {
                if thisReceipt.creditCard == sectionNames[index] {
                    mySeperatedReceipts[index].append(thisReceipt)
                }
            }
        }
        
    }
    
    //setup table view
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = UIColor.cyan
        
        let label = UILabel()
        label.text = sectionNames[section]
        label.frame = CGRect(x: 5, y: 5, width: 200, height: 35)
        view.addSubview(label)
        
        return view
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //use the section var to cycle through each val.  If 4 sections the section var will be 0, then 1, 2 and 3
        return mySeperatedReceipts[section].count
    }
    
//    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        //use the section var to cycle through each val.  If 4 sections the section var will be 0, then 1, 2 and 3
//        return sectionNames[section]
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! ReceiptCell
        
        cell.lblReceiptName.text = mySeperatedReceipts[indexPath.section][indexPath.row].note
        cell.lblIsVerified.text = mySeperatedReceipts[indexPath.section][indexPath.row].isVerified
        cell.lblDate.text = mySeperatedReceipts[indexPath.section][indexPath.row].date
        cell.lblCreditCard.text = mySeperatedReceipts[indexPath.section][indexPath.row].creditCard
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        //return the total numbers of credit cards entered into the database
        return creditCardNames.count
    }
    
    func configureTableView () {
        //tblView.rowHeight = UITableViewAutomaticDimension
        tblView.estimatedRowHeight = 160.0
        
    }
    
}


