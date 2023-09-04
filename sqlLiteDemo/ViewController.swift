//
//  ViewController.swift
//  sqlLiteDemo
//
//  Created by Eman Khaled on 07/06/2023.
//

import UIKit
import SQLite3

class ViewController: UIViewController {
    //name of c pointer el pointer dah beshawer 3la el db nafsaha
    var db: OpaquePointer?
    // (createtableStat) -> 3bahrah 3n opaquepointer shayel el stat bta4et el sql deh
    var createTableStat : OpaquePointer?
    @IBOutlet var nameTF: UIView!
    
    @IBOutlet var idTF: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var file = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
        print(file!)
        var path = file?.appending(path: "swift.sqlite").relativePath
        print(path!)
        // be ya5od mni object be refere 3la el db nafsaha aw el sqlite
        //haygeb el  pointer dah we y5leh yshawer 3la el db or sqlite nafsaha
        // ka2ni ba2olo 23mel open w hotely el ref bta3 el path gowah el db deh
        
        
        if sqlite3_open(path, &db) == SQLITE_OK{ //file Opened
            let createTableString = """
CREATE TABLE IF NOT EXISTS contact"(
ID INT PRIMARY KEY NOT NULL,
NAME CHAR(255));
"""
            //SQLITE_DONE be make sure en feh result et3mlet henah
            if sqlite3_prepare_v2(db, createTableString , -1, &createTableStat, nil) == SQLITE_OK{
                print("table prepared ...")
                
                if sqlite3_step(createTableStat) == SQLITE_DONE {
                    print("contact created..")
                }else{
                    print("table not creation")
                }
                
            }else{
                print("contact not prepare")
            }
            
        }else
        {
            print("failed to open")
        }
   
    }
    @IBAction func updateToDB(_ sender: Any) {
    }
    
    @IBAction func addToDB(_ sender: Any) {
    }
    
    @IBAction func readToDB(_ sender: Any) {
    }
    
    @IBAction func deleteToDB(_ sender: Any) {
    }
    
}

