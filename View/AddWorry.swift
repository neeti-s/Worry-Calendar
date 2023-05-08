//
//  AddWorry.swift
//  WorryCalendar
//
//  Created by itpstudent on 5/2/23.
//

import SwiftUI

struct AddWorry: View {
    
    @State private var showingAlert = false;
    @State private var selectedDate = Date()
    @State private var worryName = ""
    var body: some View {
        
        VStack {
            NavigationView{
                VStack{
                    Text("What are you worrying about?")
                        .font(.title3.bold())
                    
                    TextField("Enter your worry", text: $worryName)
                        .textFieldStyle(.roundedBorder)
                    
                    DatePicker("When to worry?", selection: $selectedDate)
                        .font(.callout)
                    
                    Button("Save Worry") {
                        
                        showingAlert = true
                        
                    }
                    
                    .alert("Worry has been saved.", isPresented: $showingAlert) {
                        
                        Button("OK", role: .cancel) { }
                        
                    }
                    
                    
                    
                }
            }                 .padding(.horizontal)
            
            
            
        }
        
        
    }
    }


struct AddWorry_Previews: PreviewProvider {
    static var previews: some View {
        AddWorry()
    }
}



