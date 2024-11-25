//
//  PublishProductView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 25/11/24.
//

import SwiftUI

struct PublishProductView: View {
    @State private var productName: String = ""
    @State private var productDescription: String = ""
    @State private var productPrice: String = ""
    @State private var productCategory: String = ""
    @State private var productLocation: String = ""
    @State private var selectedImages: [UIImage] = [] // Mock para fotos
    @State private var showingImagePicker = false
    @State private var selectedCategoryIndex: Int = 0
    
    let categories = ["Móveis", "Roupas", "Eletrônicos", "Livros", "Outros"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Seção para adicionar fotos
                    Text("Fotos do Produto")
                        .font(.headline)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(selectedImages, id: \.self) { image in
                                Image(uiImage: image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                            Button(action: {
                                showingImagePicker.toggle()
                            }) {
                                VStack {
                                    Image(systemName: "plus")
                                        .font(.largeTitle)
                                        .foregroundColor(.gray)
                                    Text("Adicionar")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                }
                                .frame(width: 100, height: 100)
                                .background(Color.gray.opacity(0.2))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                    }
                    
                    // Título do produto
                    TextField("Título do Produto", text: $productName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    // Descrição do produto
                    TextField("Descrição", text: $productDescription, axis: .vertical)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .lineLimit(3)
                    
                    // Preço do produto
                    TextField("Preço (R$)", text: $productPrice)
                        .keyboardType(.decimalPad)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    // Categoria do produto
                    Picker("Categoria", selection: $selectedCategoryIndex) {
                        ForEach(0..<categories.count) {
                            Text(categories[$0])
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                    .padding(.vertical)
                    
                    // Localização
                    TextField("Localização", text: $productLocation)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    // Botão de Publicar
                    Button(action: publishProduct) {
                        HStack {
                            Image(systemName: "paperplane.fill")
                            Text("Publicar Produto")
                                .fontWeight(.bold)
                        }
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                    }
                }
                .padding()
            }
            .navigationTitle("Publicar Produto")
            .navigationBarTitleDisplayMode(.inline)
            .sheet(isPresented: $showingImagePicker) {
                ImagePicker(selectedImages: $selectedImages)
            }
        }
    }
    
    // Função para publicar o produto
    private func publishProduct() {
        print("Produto publicado com sucesso!")
        print("Nome: \(productName), Descrição: \(productDescription), Preço: \(productPrice), Categoria: \(categories[selectedCategoryIndex]), Localização: \(productLocation)")
    }
}

// Mock de Image Picker
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImages: [UIImage]
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = true
        picker.mediaTypes = ["public.image"]
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        let parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.editedImage] as? UIImage ?? info[.originalImage] as? UIImage {
                parent.selectedImages.append(image)
            }
            picker.dismiss(animated: true)
        }
    }
}

struct PublishProductView_Previews: PreviewProvider {
    static var previews: some View {
        PublishProductView()
    }
}
