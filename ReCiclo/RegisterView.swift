//
//  RegisterView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 25/11/24.
//
import SwiftUI

struct RegisterView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var location: String = ""
    @State private var isShowingPassword: Bool = false
    @State private var isLoading: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            // Título
            Text("Criar Conta")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("bluePrimary"))

            // Campo de Nome
            TextField("Nome Completo", text: $name)
                .padding()
                .background(Color("greenSecondary"))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("greenSecondary"), lineWidth: 1)
                )

            // Campo de Email
            TextField("Email", text: $email)
                .padding()
                .background(Color("greenSecondary"))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("greenSecondary"), lineWidth: 1)
                )
                .keyboardType(.emailAddress)
                .autocapitalization(.none)

            // Campo de Senha
            HStack {
                if isShowingPassword {
                    TextField("Senha", text: $password)
                } else {
                    SecureField("Senha", text: $password)
                }
                Button(action: {
                    isShowingPassword.toggle()
                }) {
                    Image(systemName: isShowingPassword ? "eye.slash" : "eye")
                        .foregroundColor(Color("greenTertiary"))
                }
            }
            .padding()
            .background(Color("greenSecondary"))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("greenSecondary"), lineWidth: 1)
            )

            // Campo de Confirmação de Senha
            SecureField("Confirmar Senha", text: $confirmPassword)
                .padding()
                .background(Color("greenSecondary"))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("greenSecondary"), lineWidth: 1)
                )

            // Campo de Localização
            TextField("Localização (Cidade/Estado)", text: $location)
                .padding()
                .background(Color("greenSecondary"))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("greenSecondary"), lineWidth: 1)
                )

            // Botão de Cadastro
            Button(action: registerUser) {
                if isLoading {
                    ProgressView()
                        .tint(.white)
                } else {
                    Text("Cadastrar")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color("bluePrimary"))
            .cornerRadius(10)

            Spacer()

            // Texto de redirecionamento para login
            HStack {
                Text("Já tem uma conta?")
                    .foregroundColor(Color("greenSecondary"))

                Button(action: navigateToLogin) {
                    Text("Faça login")
                        .foregroundColor(Color("greenSecondary"))
                        .fontWeight(.bold)
                }
            }
        }
        .padding()
        .background(
            LinearGradient(
                gradient: Gradient(colors: [Color("greenSecondary"), Color("greenTertiary")]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .edgesIgnoringSafeArea(.all))
    }

    // Funções de ação
    func registerUser() {
        isLoading = true
        // Adicione lógica para registrar o usuário
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
            print("Usuário registrado com sucesso.")
        }
    }

    func navigateToLogin() {
        print("Redirecionar para a tela de login.")
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
