//
//  AdvancedFilterView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 10/12/24.
//

import SwiftUI

struct AdvancedFilterView: View {
    // Estado para armazenar os filtros selecionados
    @State private var selectedCondition: String = "Novo"
    @State private var priceRange: Double = 100.0
    @State private var distance: Double = 10.0
    
    let conditions = ["Novo", "Usado", "Recondicionado"]
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Título da tela
                Text("Filtros Avançados")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.top, 20)
                
                // Filtro de Condição do Produto
                VStack(alignment: .leading) {
                    Text("Condição do Produto")
                        .font(.headline)
                    
                    Picker("Condição", selection: $selectedCondition) {
                        ForEach(conditions, id: \.self) { condition in
                            Text(condition)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal)
                }
                
                // Filtro de Faixa de Preço
                VStack(alignment: .leading) {
                    Text("Faixa de Preço")
                        .font(.headline)
                    
                    Slider(value: $priceRange, in: 0...1000, step: 10) {
                        Text("Preço")
                    }
                    .accentColor(.green)
                    .padding(.horizontal)
                    
                    Text("R$ \(Int(priceRange))")
                        .font(.subheadline)
                        .padding(.horizontal)
                }
                
                // Filtro de Distância
                VStack(alignment: .leading) {
                    Text("Distância (km)")
                        .font(.headline)
                    
                    Slider(value: $distance, in: 1...100, step: 1) {
                        Text("Distância")
                    }
                    .accentColor(.blue)
                    .padding(.horizontal)
                    
                    Text("\(Int(distance)) km")
                        .font(.subheadline)
                        .padding(.horizontal)
                }
                
                // Botão de Aplicar Filtros
                Button(action: {
                    applyFilters()
                }) {
                    Text("Aplicar Filtros")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .padding(.top, 20)
                
                Spacer()
            }
            .padding()
            .navigationBarTitle("Filtros Avançados", displayMode: .inline)
        }
    }
    
    // Função para aplicar os filtros
    func applyFilters() {
        // Aqui, você pode aplicar a lógica de filtro de acordo com os valores selecionados.
        print("Filtro aplicado!")
        print("Condição: \(selectedCondition)")
        print("Preço: R$ \(Int(priceRange))")
        print("Distância: \(Int(distance)) km")
    }
}

struct AdvancedFilterView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedFilterView()
    }
}
