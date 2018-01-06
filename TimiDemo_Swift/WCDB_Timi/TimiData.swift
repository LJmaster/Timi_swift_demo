//
//  TimiData.swift
//  TimiDemo_Swift
//
//  Created by 杰刘 on 2018/1/4.
//  Copyright © 2018年 刘杰. All rights reserved.
//

import UIKit
import WCDBSwift

class TimiData: NSObject {

    
    func craetTable(baseDirectory:String) {
         print("Sample-table Begin")
        let className = String(describing: SampleTable.self)
//        let path = URL(fileURLWithPath: baseDirectory).appendingPathComponent(className).path
        let filePath = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        let documentPath = filePath.last
        let path = documentPath! + "/" + baseDirectory
        
        
          print("数据库地址 \(path)")
        let tableName = className
        
        let database = Database(withPath: path)
        database.close(onClosed: {
            try? database.removeFiles()
        })
        //创建表跟索引
        do {
            try database.create(table: tableName, of: SampleTable.self)
        } catch let error {
            print("creat table error: \(error)")
        }
        
        
        let object = SampleTable()
        object.intValue = 1;
        object.stringValue = "liujie"
        object.allMoney = "20123"
        object.timedate = "2018.1.5"
        object.projectImage = ""
        object.incomeName = "投资"
        object.incomeMoney = "100"
        object.incomebeizhuImage = "beizhu"
        
        object.expensesName = "消费"
        object.expensesName = "300"
        object.expensesbeizhuImage = "beizhu"
        
        do {
            try database.insert(objects: object, intoTable: tableName)
        } catch let error {
            print(error)
        }
        
        
//
//        //Drop table
//        do {
//            try database.drop(table: tableName)
//        } catch let error {
//            print("drop table error: \(error)")
//        }
//        //Create table from column def
//        do {
//            let intValueDef = SampleTable.Properties.intValue.asDef(with: .integer32)
//            let stringValueDef = SampleTable.Properties.stringValue.asDef(with: .text)
//
//            try database.create(table: tableName,
//                                with: intValueDef, stringValueDef)
//        } catch let error {
//            print("create table from column def error: \(error)")
//        }
//        //Create index from column index
//        let indexSubfix = "_index"
//        let indexName = tableName + indexSubfix
//        do {
//            try database.create(index: indexName,
//                                with: SampleTable.Properties.stringValue.asIndex(orderBy: .ascending),
//                                forTable: tableName)
//        } catch let error {
//            print("create index error: \(error)")
//        }
//        //Drop index
//        do {
//            try database.drop(index: indexName)
//        } catch let error {
//            print("drop index error: \(error)")
//        }
//
//        //Add column
//        do {
//            let tableName2 = tableName + "2"
//            try database.create(table: tableName2, with: (SampleTable.Properties.intValue).asDef(with: .integer32) )
//            try database.addColumn(with: (SampleTable.Properties.stringValue).asDef(with: .text), forTable: tableName2)
//        } catch let error {
//            print("add column error: \(error)")
//        }
//
//        do {
//            //Get table
//            let table: Table<SampleTable>? = try database.getTable(named: tableName)
//            //Insert/Update/Select/Delete using table
//            let object = SampleTable()
//            try table?.insert(objects: object)
//        } catch let error {
//            print("get table error: \(error)")
//        }
        
        print("Sample-table End")
    }
    
    
}
