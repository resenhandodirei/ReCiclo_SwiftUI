////
////  SearchView.swift
////  ReCiclo
////
////  Created by Larissa Martins Correa on 10/12/24.
////
//
//import SwiftUI
//
//struct SearchView: View {
//    
//    // Variáveis de estado
//    @State private var searchText = ""
//    @State private var selectedCategory = "Todos"
//    @State private var minPrice = 0.0
//    @State private var maxPrice = 1000.0
//    
//    // Lista de categorias para o filtro
//    let categories = ["Todos", "Roupas", "Eletrônicos", "Móveis", "Livros"]
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                // Barra de pesquisa
//                SearchBar(text: $searchText)
//                
//                // Filtros
//                FilterView(selectedCategory: $selectedCategory, minPrice: $minPrice, maxPrice: $maxPrice, categories: categories)
//                
//                // Lista de resultados da pesquisa
//                List {
//                    // Exemplo de produtos simulados
//                    ForEach(getFilteredProducts()) { product in
//                        ProductRow(product: product)
//                    }
//                }
//                .navigationBarTitle("Pesquisar", displayMode: .inline)
//            }
//        }
//    }
//    
//    // Função para obter os produtos filtrados com base na pesquisa e nos filtros
//    func getFilteredProducts() -> [MarketProduct] {
//        // Produtos de exemplo
//        let products = [
//            MarketProduct(id: 1, name: "Camiseta Estampada", price: 49.99, category: "Roupas"),
//            MarketProduct(id: 2, name: "Smartphone", price: 699.99, category: "Eletrônicos"),
//            MarketProduct(id: 3, name: "Sofá Comfort", price: 1200.00, category: "Móveis"),
//            MarketProduct(id: 4, name: "Livro de Aventura", price: 29.99, category: "Livros")
//        ]
//        
//        // Filtrando os produtos com base na pesquisa e nos filtros
//        return products.filter { product in
//            (searchText.isEmpty || product.name.lowercased().contains(searchText.lowercased())) &&
//            (selectedCategory == "Todos" || product.category == selectedCategory) &&
//            product.price >= minPrice && product.price <= maxPrice
//        }
//    }
//}
//
//// Barra de pesquisa
//struct SearchBar: View {
//    @Binding var text: String
//    
//    var body: some View {
//        HStack {
//            TextField("Buscar...", text: $text)
//                .padding()
//                .background(RoundedRectangle(cornerRadius: 10).fill(Color.gray.opacity(0.1)))
//                .padding([.leading, .trailing])
//        }
//    }
//}
//
//// Filtros (Categoria, Faixa de preço)
//struct FilterView: View {
//    @Binding var selectedCategory: String
//    @Binding var minPrice: Double
//    @Binding var maxPrice: Double
//    let categories: [String]
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            // Filtro de categoria
//            Text("Categoria")
//                .font(.headline)
//                .padding(.leading)
//            Picker("Categoria", selection: $selectedCategory) {
//                ForEach(categories, id: \.self) { category in
//                    Text(category).tag(category)
//                }
//            }
//            .pickerStyle(MenuPickerStyle())
//            .padding([.leading, .trailing])
//            
//            // Filtro de preço
//            Text("Faixa de Preço")
//                .font(.headline)
//                .padding([.top, .leading])
//            HStack {
//                Text("R$ \(minPrice, specifier: "%.2f")")
//                Slider(value: $minPrice, in: 0...1000, step: 10)
//                Text("R$ \(maxPrice, specifier: "%.2f")")
//            }
//            .padding([.leading, .trailing])
//        }
//        .padding(.top)
//    }
//}
//
//// Linha de produto
//struct ProductRow: View {
//    var product: MarketProduct
//    
//    var body: some View {
//        HStack {
//            Image(systemName: "photo")
//                .resizable()
//                .scaledToFit()
//                .frame(width: 50, height: 50)
//                .background(Color.gray.opacity(0.3))
//                .clipShape(RoundedRectangle(cornerRadius: 8))
//            
//            VStack(alignment: .leading) {
//                Text(product.name)
//                    .font(.headline)
//                Text("R$ \(product.price, specifier: "%.2f")")
//                    .font(.subheadline)
//                    .foregroundColor(.gray)
//            }
//            
//            Spacer()
//            
//            NavigationLink(destination: ProductDetailView(product: product)) {
//                Text("Ver Detalhes")
//                    .foregroundColor(.blue)
//            }
//
//
//        }
//        .padding()
//    }
//}
//
//// Modelo de Produto
//struct MarketProduct: Identifiable {
//    let id: Int
//    let name: String
//    let price: Double
//    let category: String
//}
//
//struct ProductDetailView: View {
//    var product: MarketProduct  // Usando MarketProduct diretamente
//    
//    var body: some View {
//        VStack {
//            Text(product.name)
//                .font(.title)
//                .padding()
//            
//            Text("R$ \(product.price, specifier: "%.2f")")
//                .font(.title2)
//                .padding()
//            
//            Text(product.category)
//                .font(.body)
//                .padding()
//            
//            Spacer()
//        }
//        .padding()
//        .navigationBarTitle("Detalhes do Produto", displayMode: .inline)
//    }
//}
//
//
//
//struct SearchView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchView()
//    }
//}
