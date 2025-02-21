//
//  ContentView.swift
//  sleepApp
//
//  Created by Tales on 21/02/25.
//

import SwiftUI

struct Welcome: View {
    @State private var currentPage = 0
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                OnboardingPage(imageName: "star", title: "Bem-vindo!", description: "Descubra os recursos do nosso app.")
                    .tag(0)
                
                OnboardingPage(imageName: "moon", title: "Fácil de Usar", description: "Uma interface simples e intuitiva.")
                    .tag(1)
                
                OnboardingPage(imageName: "sun.max", title: "Comece Agora!", description: "Clique no botão abaixo para acessar.")
                    .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))

            // Personalizando o PageControl
            HStack {
                ForEach(0..<3) { index in
                    Circle()
                        .frame(width: currentPage == index ? 10 : 6, height: currentPage == index ? 10 : 6)
                        .foregroundColor(currentPage == index ? .blue : .gray)
                        .opacity(0.8)
                }
            }
            .padding(.top, 10)
            
            // Botão apenas na última página
            if currentPage == 2 {
                Button(action: {
                    // Ação ao entrar no app
                }) {
                    Text("Começar")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 40)
                }
                .transition(.opacity)
                .animation(.easeInOut, value: currentPage)
            }
        }
        .padding(.bottom, 20)
    }
}

struct OnboardingPage: View {
    let imageName: String
    let title: String
    let description: String
    
    var body: some View {
        VStack {
            Image(systemName: imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 150, height: 150)
                .padding(.bottom, 20)
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            Text(description)
                .font(.body)
                .multilineTextAlignment(.center)
                .padding(.horizontal, 30)
        }
        .padding(.top, 50)
    }
}

#Preview {
    Welcome()
}
