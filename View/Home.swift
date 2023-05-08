//
//  Home.swift
//  WorryCalendar
//
//  Created by itpstudent on 5/2/23.
//

import SwiftUI

struct Home: View {
    
    @State var currentDate: Date = Date()
    @State private var action: Int? = 0
    @State var answer = false


    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 20) {
                
                
                //Custom Date Picker
                CustomDatePicker(currentDate: $currentDate)
            }
            .padding(.vertical)
        }
        //Safe area view?
        .safeAreaInset(edge: .bottom) {
            NavigationView {
                HStack {
                    
                    NavigationLink(destination: AddWorry()){
                        Text("Add Worry")
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(Color("Orange"), in: Capsule())
                    }
                    
                    NavigationLink(destination: ForgetWorry()) {
                        Text("Forget Worry")
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(Color("Purple"), in: Capsule())
                    }
                }
                
                .padding(.horizontal)
                .padding(.top, 10)
                .foregroundColor(.white)
                .background(.ultraThinMaterial)
            }
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
