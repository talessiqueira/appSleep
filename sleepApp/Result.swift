//
//  Result.swift
//  sleepApp
//
//  Created by Tales on 23/02/25.
//

import SwiftUI

struct Result: View {
    @State private var navigateToNextPage = false
    
    let wakeUpTime: Date
        let cycleDuration = 90 // Duração de um ciclo em minutos
        let numberOfCycles = 6
        
        var sleepCycles: [(Int, String, Int)] {
            var cycles: [(Int, String, Int)] = []
            let formatter = DateFormatter()
            formatter.timeStyle = .short
            
            // Calculando os ciclos de sono a partir da hora de acordar
            for i in 1...numberOfCycles {
                let sleepMinutes = i * cycleDuration
                if let sleepTime = Calendar.current.date(byAdding: .minute, value: -sleepMinutes, to: wakeUpTime) {
                    let formattedTime = formatter.string(from: sleepTime)
                    cycles.append((i, formattedTime, sleepMinutes))
                }
            }
            return cycles
        }
    
    var body: some View {
        NavigationStack {
            VStack {
                Image("tired-2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
                    .padding(.bottom,5)
                Text("This is your sleep cycle")
                    .font(.system(size: 25, weight: .bold))
                    .padding(.bottom, 1)
                Text("The time to sleep is available at the # 6 cycle.")
                    .font(.system(size: 18))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal)
                    .padding(.bottom)
                
                // Cabeçalho com as colunas
                
                HStack {
                    Text("# Cycle")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                    Text("Time (h)")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                    Text("Sleep Duration (min)")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                }
                .padding(.horizontal)
                
                List(sleepCycles, id: \.0) { cycle in
                    
                    
                    HStack {
                        Text("\(cycle.0)")
                            .fontWeight(.bold)
                        Spacer()
                        Text("\(cycle.1)")
                        Spacer()
                        Text("\(cycle.2)")
                    }
                }
                
                Button(action: { withAnimation(.easeInOut) {  // Adicionando animação
                    navigateToNextPage = true
                } }) {
                    Text("Set wake up time again")
                        .font(.system(size: 20, weight: .bold))
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                }
                
            }
            
            .navigationDestination(isPresented: $navigateToNextPage) {
                mainScreen()
                    .transition(.move(edge: .trailing))
                    .navigationBarBackButtonHidden(true)
            }
        }
    }
}

struct Result_Previews: PreviewProvider {
    static var previews: some View {
        Result(wakeUpTime: Date()) // Passando a data atual como exemplo
    }
}
