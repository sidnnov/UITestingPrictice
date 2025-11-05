//
//  ContentView.swift
//  UITestingPractice
//
//  Created by Tylechkin.Yuriy on 04.11.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var isLoggedIn = false
    @State private var errorMessage: String? = nil
      
    var body: some View {
        VStack(spacing: 20) {
            if isLoggedIn {
                Text("Добро пожаловать!")
                    .font(.title)
                    .accessibilityIdentifier("welcomeText")
            } else {
                TextField("Email", text: $email)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibilityIdentifier("emailField")
                
                SecureField("Пароль", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .accessibilityIdentifier("passwordField")
                
                if let error = errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .font(.subheadline)
                        .accessibilityIdentifier("generalErrorText")
                }
                
                Button("Войти") {
                    validateAndLogin()
                }
                .accessibilityIdentifier("loginButton")
                
                Text("Тестовые данные: test@test.com / 123456")
                    .font(.caption)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
    
    private func validateAndLogin() {
        errorMessage = nil
        
        if !email.isEmpty && password.isEmpty {
            errorMessage = "Пожалуйста, введите пароль."
            return
        }
        
        if email.isEmpty {
            errorMessage = "Пожалуйста, введите email."
            return
        }
        
        if email == "test@test.com" && password == "123456" {
            isLoggedIn = true
        } else {
            errorMessage = "Неверный email или пароль."
        }
    }
}



#Preview {
    ContentView()
}
