//
//  mainScreen.swift
//  sleepApp
//
//  Created by Tales on 23/02/25.
//

import SwiftUI

struct mainScreen: View {
    @State private var selectedTime = Date()
        
        var body: some View {
            VStack {
                Text("Choose the time to wake up:")
                    .font(.system(size: 20, weight: .bold))
                    .padding()
                
                DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                    .datePickerStyle(WheelDatePickerStyle())
                    .labelsHidden()
                    .padding()
                
                Button(action: {
                    print("Horário selecionado: \(selectedTime)")
                    // Aqui você pode navegar para outra tela
                }) {
                    Text("Avançar")
                        .font(.headline)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                }
            }
            .padding()
        }
}

#Preview {
    mainScreen()
}
