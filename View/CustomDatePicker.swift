//
//  CustomDatePicker.swift
//  WorryCalendar
//
//  Created by itpstudent on 5/2/23.
//

import SwiftUI


struct CustomDatePicker: View {
    
    @Binding var currentDate: Date
    
    //Month update on arrow button clicks
    @State var currentMonth: Int = 0
    
    var body: some View {
        
        VStack (spacing: 35){
            
            //Days
            let days: [String] = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
            
            HStack (spacing: 20){
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text(extraDate()[0])
                        .font(.caption)
                        .fontWeight(.semibold)
                        
                    Text(extraDate()[1])
                        .font(.title.bold())
                }
                
                Spacer(minLength: 0);
                
                Button {
                    withAnimation{
                        currentMonth -= 1
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                }
                
                
                Button {
                    withAnimation{
                        currentMonth += 1
                    }
                } label: {
                    Image(systemName: "chevron.right")
                        .font(.title2)
                }
            }
            .padding(.horizontal)
            
            //Day View
            HStack(spacing: 0) {
                ForEach(days, id: \.self){
                    day in
                    Text(day)
                        .font(.callout)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity)
                }
            }
                
                //Dates
                //Lazy Grid
                let columns = Array(repeating: GridItem(.flexible()), count: 7)
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(extractDate()){value in
                        
                    CardView(value: value)
                            .background(
                            
                                Capsule()
                                    .fill(Color("Pink"))
                                    .padding(.horizontal, 8)
                                    .opacity(isSameDay(date1: value.date, date2: currentDate) ? 1 : 0)
                            )
                            .onTapGesture {
                                currentDate = value.date
                            }

                    }
                }
            VStack(spacing: 20){
                Text("Worries")
                    .font(.title2.bold())
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.vertical, 20)

                if let worry = worrys.first(where: {worry in
                    return isSameDay(date1: worry.worryDate, date2: currentDate)
                }){
                    ForEach(worry.worry){worry in
                        VStack(alignment: .leading, spacing: 10) {
                            //Custom timing
                            Text(worry.time
                                .addingTimeInterval(CGFloat.random(in: 0...5000)),style: .time)
                            
                            Text(worry.title)
                                .font(.title2.bold())
                        }
                        .padding(.vertical, 10)
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(
                        
                            Color("Pink")
                                .opacity(0.5)
                                .cornerRadius(10)
                        )
                    }
                }
                else {
                    Text("No Worries Found")
                }
            }
            .padding()
            }
        .onChange(of: currentMonth){newValue in
            
            //updating Month
            currentDate = getCurrentMonth()
            
        }
    }
    
    @ViewBuilder
    func CardView(value: DateValue)-> some View{
        
        VStack{
            if value.day != -1{
                if let worry = worrys.first(where: { worry in
                    
                    return isSameDay(date1: worry.worryDate, date2: value.date)
                }){
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: worry.worryDate, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    Spacer()
                    
                    Circle()
                        .fill(isSameDay(date1: worry.worryDate, date2: currentDate) ? .white :  Color("Pink"))
                        .frame(width: 8, height: 8)
                }
                else {
                    Text("\(value.day)")
                        .font(.title3.bold())
                        .foregroundColor(isSameDay(date1: value.date, date2: currentDate) ? .white : .primary)
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
            }
        }
                .padding(.vertical,9)
                .frame(height: 60, alignment: .top)
        }
        
    //Checking dates
        func isSameDay(date1: Date, date2: Date)->Bool{
            let calendar = Calendar.current
            return calendar.isDate(date1, inSameDayAs: date2)
            
        }
    //extracting Year and Month for display
    
    func extraDate()-> [String] {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY MMMM"
        
        let date = formatter.string(from: currentDate)
        return date.components(separatedBy: " ")
    }
    func getCurrentMonth()-> Date{
        let calendar = Calendar.current
        //Getting Current Month Date
        guard let currentMonth = calendar.date(byAdding: .month, value: self.currentMonth, to: Date()) else {
            return Date()
        }
        return currentMonth
    }
    func extractDate()->[DateValue]{
        
        let calendar = Calendar.current
        //Getting Current Month Date
        let currentMonth = getCurrentMonth()
        
        var days =  currentMonth.getAllDates().compactMap { date -> DateValue in
            
            //getting day
            let day = calendar.component(.day, from: date)
            return DateValue(day: day, date: date)
        }
        //adding offset days to get exact start day/date
        let firstWeekday = calendar.component(.weekday, from: days.first?.date ?? Date())
        
        for _ in 0..<firstWeekday - 1 {
            days.insert(DateValue(day: -1, date: Date()), at: 0)
        }
        return days
    }
}

struct CustomDatePicker_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// Extending Data to get Current Month Dates
extension Date{
    
    func getAllDates()->[Date]{
        
        let calendar = Calendar.current
        
        //start date
        let startDate = calendar.date(from: Calendar.current.dateComponents([.year, .month], from: self))!
        let range = calendar.range(of: .day, in: .month, for: self)!
        //getting date
        return range.compactMap { day -> Date in
            
            return calendar.date(byAdding: .day, value: day - 1, to: startDate)!
            
        }
    }
}