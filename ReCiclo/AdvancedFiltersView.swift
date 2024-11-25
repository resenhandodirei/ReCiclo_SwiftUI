//
//  AdvancedFiltersView.swift
//  ReCiclo
//
//  Created by Larissa Martins Correa on 25/11/24.
//

import SwiftUI

struct AdvancedFiltersView: View {
    // Estados para armazenar os valores dos filtros
    @State private var selectedCondition: String = "Qualquer"
    @State private var minPrice: Double = 0
    @State private var maxPrice: Double = 1000
    @State private var maxDistance: Double = 50
    @State private var showOnlyFavorites: Bool = false
    
    // Lista de condições possíveis
    private let conditions = ["Qualquer", "Novo", "Usado", "Seminovo"]
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    // Seção: Condição do produto
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Condição do Produto")
                            .font(.headline)
                        
                        Picker("Condição", selection: $selectedCondition) {
                            ForEach(conditions, id: \.self) { condition in
                                Text(condition)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    // Seção: Faixa de preço
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Faixa de Preço (R$)")
                            .font(.headline)
                        
                        HStack {
                            Text("Min: R$\(Int(minPrice))")
                            Spacer()
                            Text("Max: R$\(Int(maxPrice))")
                        }
                        
                        RangeSlider(minValue: $minPrice, maxValue: $maxPrice, range: 0...5000)
                    }
                    
                    // Seção: Distância Máxima
                    VStack(alignment: .leading, spacing: 8) {
                        Text("Distância Máxima (km)")
                            .font(.headline)
                        
                        Slider(value: $maxDistance, in: 0...200, step: 5) {
                            Text("Distância")
                        }
                        .accentColor(.green)
                        
                        Text("\(Int(maxDistance)) km")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                    
                    // Seção: Somente favoritos
                    Toggle("Exibir apenas favoritos", isOn: $showOnlyFavorites)
                        .toggleStyle(SwitchToggleStyle(tint: .green))
                        .font(.headline)
                    
                    // Botão: Aplicar Filtros
                    Button(action: {
                        applyFilters()
                    }) {
                        Text("Aplicar Filtros")
                            .font(.headline)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                    }
                }
                .padding()
            }
            .navigationTitle("Filtros Avançados")
            .background(Color("LightBeige").edgesIgnoringSafeArea(.all))
        }
    }
    
    // Função para aplicar os filtros
    private func applyFilters() {
        print("Filtros aplicados:")
        print("Condição: \(selectedCondition)")
        print("Preço: R$\(Int(minPrice)) - R$\(Int(maxPrice))")
        print("Distância: \(Int(maxDistance)) km")
        print("Somente favoritos: \(showOnlyFavorites)")
    }
}

struct RangeSlider: View {
    @Binding var minValue: Double
    @Binding var maxValue: Double
    var range: ClosedRange<Double>
    
    var body: some View {
        VStack {
            HStack {
                Slider(value: $minValue, in: range, step: 1)
                Slider(value: $maxValue, in: range, step: 1)
            }
        }
    }
}

struct AdvancedFiltersView_Previews: PreviewProvider {
    static var previews: some View {
        AdvancedFiltersView()
    }
}
