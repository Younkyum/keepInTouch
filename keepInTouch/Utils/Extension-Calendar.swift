//
//  Extension-Date.swift
//  keepInTouch
//
//  Created by YounkyumJin on 3/26/24.
//

import SwiftUI

extension Date {
    var onlyDate: Date {
        let component = Calendar.current.dateComponents([.year, .month, .day], from: self)
        return Calendar.current.date(from: component) ?? Date()
    }
}

extension Calendar {
    func getDateGap(from: Date, to: Date) -> Int {
        let fromDateOnly = from.onlyDate
        let toDateOnly = to.onlyDate
        return self.dateComponents([.day], from: fromDateOnly, to: toDateOnly).day ?? 0
    }
}

func relativeDateFromToday(year: Int, month: Int, day: Int) -> Int {
    let myDateComponents = DateComponents(year: year, month: month, day: day)
    
    let gap = Calendar.current.getDateGap(from: Date(), to: Calendar.current.date(from: myDateComponents)!)
    
    return gap
}


func relativeDateFromToday(date: String) -> Int {
    let dateData = date.split(separator: "-")
    
    let year = Int(dateData[0])
    let month = Int(dateData[1])
    let day = Int(dateData[2])
    
    let myDateComponents = DateComponents(year: year, month: month, day: day)
    
    let gap = Calendar.current.getDateGap(from: Date(), to: Calendar.current.date(from: myDateComponents)!)
    
    return gap
}


func getRelativeDateString(date: String) -> String {
    let gap = relativeDateFromToday(date: date)
    
    switch gap {
    case ...(-1):
        return "\(gap * -1)일 지남"
    case 1...:
        return "\(gap)일 후"
    case 0:
        return "오늘"
    default:
        return ""
        
    }
}
