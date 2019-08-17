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
    
    var body: some View {
        
        VStack {
            
            BarView(input: $input)
            
            List (
                viewModel.currencyList.filter {
                    $0.value != "0.0" &&
                        $0.value != "0" &&
                        $0.name != viewModel.baseCurrency.stringValue
                },
                id: \.value
            ) { currency in MainItemView(item: currency) }
            
            KeyboardView(input: $input)
            
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
