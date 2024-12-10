//
//  ProductPublicationView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 10/12/24.
//

import SwiftUI

struct ProductPublicationView: View {
    @State private var productName: String = ""
    @State private var productPrice: String = ""
    @State private var productDescription: String = ""
    @State private var productCategory: String = ""
    @State private var productLocation: String = ""
    @State private var productImages: [UIImage] = []  // Lista de imagens
    @State private var showingImagePicker = false

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                // Nome do Produto
                TextField("Nome do Produto", text: $productName)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                // Preço do Produto
                TextField("Preço", text: $productPrice)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                // Descrição do Produto
                TextField("Descrição do Produto", text: $productDescription)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                // Categoria do Produto
                TextField("Categoria", text: $productCategory)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                // Localização do Produto
                TextField("Localização", text: $productLocation)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)

                // Seção de Imagens
                VStack {
                    Text("Imagens do Produto")
                        .font(.headline)
                        .padding(.top)
                    if productImages.isEmpty {
                        Text("Nenhuma imagem selecionada.")
                            .foregroundColor(.gray)
                    } else {
                        ScrollView(.horizontal) {
                            HStack {
                                ForEach(productImages, id: \.self) { image in
                                    Image(uiImage: image)
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 100, height: 100)
                                        .clipShape(RoundedRectangle(cornerRadius: 10))
                                        .padding(5)
                                }
                            }
                        }
                    }
                    Button("Adicionar Imagens") {
                        showingImagePicker.toggle()
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .padding(.top, 10)
                }

                // Botão para Publicar o Produto
                Button(action: {
                    publishProduct()
                }) {
                    Text("Publicar Produto")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
                .padding(.horizontal)

                Spacer()
            }
        }
        .navigationTitle("Publicar Produto")
        .sheet(isPresented: $showingImagePicker, content: {
            ImagePickerView(selectedImages: $productImages)
        })
    }

    // Função para publicar o produto
    func publishProduct() {
        // Aqui você pode adicionar a lógica para salvar as informações e enviar para o servidor ou banco de dados
        print("Produto publicado:")
        print("Nome: \(productName)")
        print("Preço: \(productPrice)")
        print("Descrição: \(productDescription)")
        print("Categoria: \(productCategory)")
        print("Localização: \(productLocation)")
        print("Imagens: \(productImages.count)")
    }
}

// Seletor de Imagens
struct ImagePickerView: View {
    @Binding var selectedImages: [UIImage]
    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            VStack {
                Text("Escolha as Imagens")
                    .font(.headline)
                    .padding()

                // Picker de Imagens
                Button("Escolher Imagens") {
                    // Lógica para escolher as imagens da galeria
                    // Aqui você pode usar o ImagePicker para integrar a galeria de fotos do dispositivo
                    // Para fins de demonstração, vamos simular com imagens falsas
                    let image = UIImage(systemName: "photo")!
                    selectedImages.append(image) // Simula a escolha de uma imagem
                    dismiss()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
                .padding(.top, 10)

                Spacer()
            }
            .navigationBarItems(trailing: Button("Fechar") {
                dismiss()
            })
        }
    }
}

struct ProductPublicationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductPublicationView()
        }
    }
}

