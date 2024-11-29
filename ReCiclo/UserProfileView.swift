//
//  UserProfileView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 25/11/24.
//

import SwiftUI

struct UserProfileView: View {
    @State private var userName: String = "João Silva"
    @State private var userPhoto: Image? = Image(systemName: "person.crop.circle.fill")
    @State private var userRating: Double = 4.5
    @State private var itemsSold: Int = 24
    @State private var itemsBought: Int = 15
    @State private var showEditProfile = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Foto e Nome do Usuário
                VStack(spacing: 10) {
                    userPhoto?
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                        .shadow(radius: 5)
                    
                    Text(userName)
                        .font(.title2)
                        .fontWeight(.bold)
                }
                
                // Avaliações e Estatísticas
                HStack(spacing: 40) {
                    VStack {
                        Text("\(String(format: "%.1f", userRating))")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.greenTertiary)
                        Text("Avaliação")
                            .font(.subheadline)
                            .foregroundColor(.bluePrimary)
                    }
                    VStack {
                        Text("\(itemsSold)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.greenTertiary)
                        Text("Vendidos")
                            .font(.subheadline)
                            .foregroundColor(.bluePrimary)
                    }
                    VStack {
                        Text("\(itemsBought)")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.greenTertiary)
                        Text("Comprados")
                            .font(.subheadline)
                            .foregroundColor(.bluePrimary)
                    }
                }
                
                Divider()
                
                // Botões de Ação
                VStack(spacing: 15) {
                    NavigationLink(destination: UserItemsView(title: "Itens à Venda")) {
                        ProfileActionButton(title: "Meus Itens à Venda", icon: "tag.fill")
                    }
                    NavigationLink(destination: UserItemsView(title: "Itens Comprados")) {
                        ProfileActionButton(title: "Itens Comprados", icon: "cart.fill")
                    }
                    Button(action: {
                        showEditProfile.toggle()
                    }) {
                        ProfileActionButton(title: "Editar Perfil", icon: "pencil.circle.fill")
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Meu Perfil")
            .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: $showEditProfile) {
            EditProfileView(userName: $userName, userPhoto: $userPhoto)
        }
    }
}

struct ProfileActionButton: View {
    let title: String
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.white)
                .frame(width: 20, height: 20)
                .padding(8)
                .background(Circle().fill(Color.greenSecondary))
            
            Text(title)
                .font(.body)
                .foregroundColor(.primary)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.greenTertiary)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}

// View de Edição de Perfil
struct EditProfileView: View {
    @Binding var userName: String
    @Binding var userPhoto: Image?
    @State private var inputName: String = ""
    @State private var isPhotoPickerPresented = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Informações do Perfil")) {
                    TextField("Nome", text: $inputName)
                    
                    Button(action: {
                        isPhotoPickerPresented.toggle()
                    }) {
                        HStack {
                            Text("Alterar Foto")
                            Spacer()
                            userPhoto?
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40, height: 40)
                                .clipShape(Circle())
                        }
                    }
                }
            }
            .navigationTitle("Editar Perfil")
            .navigationBarItems(trailing: Button("Salvar") {
                if !inputName.isEmpty {
                    userName = inputName
                }
            })
            .sheet(isPresented: $isPhotoPickerPresented) {
                PhotoPickerView(image: $userPhoto)
            }
        }
    }
}

// Picker de Foto (Simples Mockup)
struct PhotoPickerView: View {
    @Binding var image: Image?
    
    var body: some View {
        VStack {
            Text("Escolha uma foto")
                .font(.headline)
            Spacer()
            Button("Fechar") {
                image = Image(systemName: "person.crop.circle.fill")
            }
            .padding()
        }
    }
}

// Placeholder para telas de navegação
struct UserItemsView: View {
    let title: String
    
    var body: some View {
        Text("\(title) em breve...")
            .font(.title)
            .foregroundColor(.gray)
    }
}

// Preview
struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
