//
//  ForgetWorry.swift
//  WorryCalendar
//
//  Created by itpstudent on 5/2/23.
//

import SwiftUI

struct ForgetWorry: View {
    @State private var gradient1 = Color.blue.opacity(1.0)
    @State private var gradient2 = Color.red.opacity(1.0)
    @State private var animatedGradient = false

    var body: some View {
        
        VStack{
            ColorPicker("Gradient Colour", selection: $gradient2)
            
            ColorPicker("Gradient Colour", selection: $gradient1)
            
            LinearGradient(colors: [gradient1, gradient2], startPoint: animatedGradient ? .topLeading: .bottomLeading, endPoint:animatedGradient ? .bottomTrailing: .topTrailing)
            
                .onAppear{ withAnimation(.linear(duration: 2.0).repeatForever(autoreverses: true))
                    
                    {
                        
                        animatedGradient.toggle()
                        
                    }
                    
                    
                    
            }
        }
        .padding(.horizontal)
    }
}

struct ForgetWorry_Previews: PreviewProvider {
    static var previews: some View {
        ForgetWorry()
    }
}
