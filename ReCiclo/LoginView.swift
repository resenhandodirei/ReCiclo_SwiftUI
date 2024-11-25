//
//  LoginView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 25/11/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var isShowingPassword: Bool = false
    @State private var isLoading: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            Spacer()

            // Logo do app
            Image(systemName: "leaf.circle.fill") // Substitua pelo logo real
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(Color("PrimaryGreen"))
                .padding(.bottom, 20)

            // Título
            Text("Bem-vindo ao ReCiclo")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("PrimaryGreen"))

            // Campo de Email
            TextField("Email", text: $email)
                .padding()
                .background(Color("LightBeige"))
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("PrimaryGreen"), lineWidth: 1)
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
                        .foregroundColor(Color("SecondaryGray"))
                }
            }
            .padding()
            .background(Color("LightBeige"))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("PrimaryGreen"), lineWidth: 1)
            )

            // Botão de Login
            Button(action: loginUser) {
                if isLoading {
                    ProgressView()
                        .tint(.white)
                } else {
                    Text("Entrar")
                        .font(.headline)
                        .foregroundColor(.white)
                }
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color("PrimaryGreen"))
            .cornerRadius(10)

            // Texto de Esqueci minha senha
            Button(action: resetPassword) {
                Text("Esqueci minha senha")
                    .font(.subheadline)
                    .foregroundColor(Color("PrimaryGreen"))
            }

            Divider().padding(.vertical)

            // Botões de Redes Sociais
            HStack(spacing: 20) {
                SocialLoginButton(iconName: "logo.facebook", text: "Facebook", backgroundColor: Color.blue) {
                    authenticateWithFacebook()
                }

                SocialLoginButton(iconName: "logo.google", text: "Google", backgroundColor: Color.red) {
                    authenticateWithGoogle()
                }
            }

            Spacer()

            // Texto de cadastro
            HStack {
                Text("Ainda não tem uma conta?")
                    .foregroundColor(Color("SecondaryGray"))

                Button(action: registerUser) {
                    Text("Cadastre-se")
                        .foregroundColor(Color("PrimaryGreen"))
                        .fontWeight(.bold)
                }
            }
        }
        .padding()
        .background(Color("LightBeige"))
        .edgesIgnoringSafeArea(.all)
    }

    // Funções de ações (exemplo)
    func loginUser() {
        isLoading = true
        // Adicione lógica para autenticação com email/senha
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
            print("Usuário autenticado com email/senha.")
        }
    }

    func resetPassword() {
        print("Redirecionar para a tela de redefinição de senha.")
    }

    func registerUser() {
        print("Redirecionar para a tela de registro.")
    }

    func authenticateWithFacebook() {
        print("Autenticar com Facebook.")
    }

    func authenticateWithGoogle() {
        print("Autenticar com Google.")
    }
}

// Botão de redes sociais
struct SocialLoginButton: View {
    let iconName: String
    let text: String
    let backgroundColor: Color
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: iconName)
                    .font(.headline)
                    .foregroundColor(.white)

                Text(text)
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(backgroundColor)
            .cornerRadius(10)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
