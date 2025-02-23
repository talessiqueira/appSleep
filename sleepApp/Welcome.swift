//
//  ContentView.swift
//  sleepApp
//
//  Created by Tales on 21/02/25.
//

import SwiftUI

struct Welcome: View {
    @State private var currentPage = 0
    @State private var navigateToNextPage = false
    
    var body: some View {
        NavigationStack {
            VStack {
                TabView(selection: $currentPage) {
                    OnboardingPage(imageName: "night-3", title: "Welcome!", description: "Find a new way to improve your sleep.")
                        .tag(0)
                    
                    OnboardingPage(imageName: "tired", title: "Don't get tired!", description: "Knowing when go to bed can help you with busy days.")
                        .tag(1)
                    
                    OnboardingPage(imageName: "night-4", title: "Good night!", description: "Now, we only need an information about your time to wake up.")
                        .tag(2)
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                // Personalizando o PageControl
                HStack {
                    ForEach(0..<3) { index in
                        Circle()
                            .frame(width: currentPage == index ? 10 : 6, height: currentPage == index ? 10 : 6)
                            .foregroundColor(currentPage == index ? .yellow : .gray)
                            .opacity(0.8)
                            .padding(.bottom, 50) // 🔹 Aumenta o espaço abaixo do indicador
                    }
                }
                
                
                // 🔥 Criamos um espaço fixo para o botão, mas só mostramos na última tela
                if currentPage == 2 {
                    navigationDestination(isPresented: $navigateToNextPage) {
                        mainScreen()
                    Button(action: {
                        navigateToNextPage = true
                    }) {
                        Text("Let's go!")
                            .font(.system(size: 20, weight: .bold))
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .padding(.horizontal, 50)
                    }
                    .transition(.opacity) // Adiciona um efeito suave de aparecimento
                    }
                } else {
                    // 🔹 Espaço reservado para evitar que o indicador mude de posição
                    Color.clear
                        .frame(height: 60) // Altura do botão para manter alinhamento
                }
            }
            
            .padding(.bottom, 10)
            
            Text("Images from flaticon")
                .font(.system(size: 10))
                .foregroundColor(.gray)
            
        }
    }
}

struct OnboardingPage: View {
    let imageName: String
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .padding(.bottom, 20)
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            Text(description)
                .font(.system(size: 20))
                .multilineTextAlignment(.center)
                .padding(.horizontal, 40)
        }
        .padding(.top, 50)
    }
}

#Preview {
    Welcome()
}
