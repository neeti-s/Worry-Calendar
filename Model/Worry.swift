//
//  Worry.swift
//  WorryCalendar
//
//  Created by itpstudent on 5/2/23.
//

import SwiftUI

//Worry Model and Sample Worry
//Array of Worries
struct Worry: Identifiable{
    var id = UUID().uuidString
    var title: String
    var time: Date = Date()
}

//Total Worry Meta View
struct WorryMetaData: Identifiable{
    var id = UUID().uuidString
    var worry: [Worry]
    var worryDate: Date
}

//Sample Date for Testing
func getSampleDate(offset: Int)->Date{
    let calendar = Calendar.current
    let date = calendar.date(byAdding: .day, value: offset, to: Date())
    return date ?? Date()
}

//Sample Worry
var worrys: [WorryMetaData] = [
    
    WorryMetaData(worry: [
    
        Worry(title: "Finals Week"),
        Worry(title: "Interview"),
        Worry(title: "Pack for trip")
    ], worryDate: getSampleDate(offset: 1)),
    
    WorryMetaData(worry: [
    
        Worry(title: "Look for jobs")
    ], worryDate: getSampleDate(offset: -3)),
    WorryMetaData(worry: [
    
        Worry(title: "Improve portfolio")
    ], worryDate: getSampleDate(offset: -8)),
    WorryMetaData(worry: [
    
        Worry(title: "Meeting with boss")
    ], worryDate: getSampleDate(offset: 10)),
    WorryMetaData(worry: [
    
        Worry(title: "Class presentation")
    ], worryDate: getSampleDate(offset: -22)),
    WorryMetaData(worry: [
    
        Worry(title: "Results for exam")
    ], worryDate: getSampleDate(offset: 15)),
    WorryMetaData(worry: [
    
        Worry(title: "Grant deadline")
    ], worryDate: getSampleDate(offset: -20)),
]
