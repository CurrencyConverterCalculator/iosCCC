//
//  ContentView.swift
//  CurrencyConverterCalculator
//
//  Created by Mustafa Ozhan on 04/08/2019.
//  Copyright © 2019 Mustafa Ozhan. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewModel: MainViewModel
    @State var input = ""
    @State var isPresented = false
    
    var body: some View {
        
        VStack {
            
            Button(
                action: {
                    self.isPresented.toggle()
            },
                label: {
                    Text(input)
                    
                    if viewModel.output.isEmpty {
                        Text(viewModel.baseCurrency.description)
                    } else {
                        Text("\(viewModel.output) \(viewModel.baseCurrency.description)")
                    }
            }
            ).sheet(
                isPresented: $isPresented,
                content: {
                    Text("Change the base currency")
                        .padding(.top, 32)
                    List (self.viewModel.currencyList.map { $0.shortCode }, id: \.self) { currency in
                        Text(currency.description)
                            .onTapGesture {
                                self.viewModel.baseCurrency = currency
                                self.isPresented = false
                        }
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    }
            }
            )
            
            List (
                viewModel.currencyList.filter {
                    $0.value != "0.0" && $0.value != "0"
                },
                id: \.self
            ) { currency in ItemView(item: currency) }
            
            KeyboardView(input: self.$input)
            
        }
        .onAppear { self.viewModel.fetchRates() }
        .edgesIgnoringSafeArea(.bottom)
        
    }
    
}

#if DEBUG
struct ContentViewPreviews: PreviewProvider {
    static var previews: some View {
        MainView().environmentObject(MainViewModel())
    }
}
#endif
