////
////  ProductDetailView.swift
////  ReCiclo
////
////  Created by Larissa Martins Correa on 10/12/24.
////
//
//import SwiftUI
//
//// Modelo de Produto
//struct ProductDetail: Identifiable {
//    var id: Int
//    var name: String
//    var price: Double
//    var description: String
//    var location: String
//    var images: [String] // URLs ou nomes das imagens
//}
//
//struct ProductDetailView: View {
//    // Produto a ser exibido
//    var product: ProductDetail
//    
//    var body: some View {
//        ScrollView {
//            VStack(spacing: 20) {
//                // Carrossel de Imagens
//                ImageCarouselView(images: product.images)
//                    .frame(height: 300)
//                
//                // Nome e Preço
//                VStack(alignment: .leading, spacing: 10) {
//                    Text(product.name)
//                        .font(.title)
//                        .fontWeight(.bold)
//                    
//                    Text("R$ \(String(format: "%.2f", product.price))")
//                        .font(.title2)
//                        .foregroundColor(.green)
//                }
//                .padding(.horizontal)
//                
//                // Descrição do Produto
//                VStack(alignment: .leading) {
//                    Text("Descrição")
//                        .font(.headline)
//                    
//                    Text(product.description)
//                        .font(.body)
//                        .foregroundColor(.gray)
//                        .lineLimit(nil)
//                }
//                .padding(.horizontal)
//                
//                // Localização
//                VStack(alignment: .leading) {
//                    Text("Localização")
//                        .font(.headline)
//                    
//                    Text(product.location)
//                        .font(.body)
//                        .foregroundColor(.gray)
//                }
//                .padding(.horizontal)
//                
//                // Botão para Iniciar o Chat
//                Button(action: {
//                    startChat()
//                }) {
//                    Text("Iniciar Chat")
//                        .font(.headline)
//                        .foregroundColor(.white)
//                        .padding()
//                        .background(Color.blue)
//                        .cornerRadius(10)
//                }
//                .padding(.top, 20)
//                .padding(.horizontal)
//                
//                Spacer()
//            }
//            .padding(.top, 20)
//        }
//        .navigationBarTitle("Detalhes do Produto", displayMode: .inline)
//    }
//    
//    // Função para iniciar o chat
//    func startChat() {
//        // Aqui você pode implementar a lógica para abrir o chat com o vendedor
//        print("Chat iniciado com o vendedor!")
//    }
//}
//
//struct ImageCarouselView: View {
//    var images: [String]
//    
//    @State private var currentIndex = 0
//    
//    var body: some View {
//        TabView(selection: $currentIndex) {
//            ForEach(0..<images.count, id: \.self) { index in
//                Image(images[index]) // Substitua por URL de imagens, se necessário
//                    .resizable()
//                    .scaledToFill()
//                    .frame(width: UIScreen.main.bounds.width, height: 300)
//                    .clipped()
//                    .tag(index)
//            }
//        }
//        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
//    }
//}
//
//struct ProductDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailView(product: ProductDetail(id: 1, name: "Smartphone XYZ", price: 1500.00, description: "Este é um smartphone de última geração, com excelente desempenho e câmera de alta qualidade.", location: "São Paulo, SP", images: ["image1", "image2", "image3"]))
//    }
//}
