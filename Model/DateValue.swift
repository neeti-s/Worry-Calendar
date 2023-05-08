//
//  DateValue.swift
//  WorryCalendar
//
//  Created by itpstudent on 5/2/23.
//

import SwiftUI

//Date Value Model

struct DateValue: Identifiable{
    var id = UUID().uuidString
    var day: Int
    var date: Date
}
