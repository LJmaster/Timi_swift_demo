//
//  SampleTable.swift
//  TimiDemo_Swift
//
//  Created by 杰刘 on 2018/1/4.
//  Copyright © 2018年 刘杰. All rights reserved.
//

import UIKit
import WCDBSwift

class SampleTable: TableCodable {
    
    var intValue: Int?
    var stringValue: String?
    
    var allMoney: String?
    var timedate: String?
    
    var projectImage: String?
    
    var expensesName: String?
    var expensesMoney: String?
    var expensesbeizhuImage: String?
    
    var incomeName: String?
    var incomeMoney: String?
    var incomebeizhuImage: String?
    
    enum CodingKeys: String, CodingTableKey {
        typealias Root = SampleTable
        static let objectRelationalMapping = TableBinding(CodingKeys.self)
        
        case intValue
        case stringValue
        
        case allMoney
        case timedate
        
        case projectImage
        
        case expensesName
        case expensesMoney
        case expensesbeizhuImage
        
        case incomeName
        case incomeMoney
        case incomebeizhuImage
        
    }
}
