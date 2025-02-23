//
//  mainScreen.swift
//  sleepApp
//
//  Created by Tales on 23/02/25.
//

import SwiftUI

struct mainScreen: View {
    @State private var selectedTime = Calendar.current.date(from: DateComponents(hour: 8, minute: 30)) ?? Date()
        
        var body: some View {
            VStack {
                
                Image("night")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.bottom, 20)
                    .padding(.top, 15)
                Text("Choose the time to wake up:")
                    .font(.system(size: 40, weight: .bold))
                
                DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                
                Button(action: {
                    print("Horário selecionado: \(selectedTime)")
                    // Aqui você pode navegar para outra tela
                }) {
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
            
            Text("Images from flaticon")
                .font(.system(size: 10))
                .foregroundColor(.gray)
        }
}

#Preview {
    mainScreen()
}
