//
//  mainScreen.swift
//  sleepApp
//
//  Created by Tales on 23/02/25.
//

import SwiftUI

struct mainScreen: View {
    @State private var selectedTime = Calendar.current.date(from: DateComponents(hour: 8, minute: 30)) ?? Date()
    @State private var navigateToNextPage = false
        
    var body: some View {
        NavigationStack{
            VStack {
    
                Image("night")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 20)
                    .padding(.top, 15)
                
                Text("Choose the time to wake up:")
                    .font(.system(size: 40, weight: .bold))
                    .padding(.horizontal, 50)
                    .multilineTextAlignment(.center)
                
                DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                
                Button(action: {withAnimation(.easeInOut) {  // Adicionando animação
                    navigateToNextPage = true
                }}) {
                    Text("Done")
                        .font(.system(size: 20, weight: .bold))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                }
            }
            
            .padding(.bottom, 10)
            
            VStack{
                Text("Images from Flaticon.")
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
                Text("Github: talessiqueira")
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
            }
            
            .navigationDestination(isPresented: $navigateToNextPage) {
                Result(wakeUpTime: selectedTime)
                        .transition(.move(edge: .trailing))
                        .navigationBarBackButtonHidden(true)
                }
        }
    }
}

#Preview {
    mainScreen()
}
