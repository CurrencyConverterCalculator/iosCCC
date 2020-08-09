//
//  SettingsView.swift
//  CurrencyConverterCalculator
//
//  Created by Mustafa Ozhan on 17/08/2019.
//  Copyright © 2019 Mustafa Ozhan. All rights reserved.
//
import SwiftUI

struct SettingsView: View, Effect {
    
    func asd(newBase: Currencies) {
        baseCurrency = newBase
    }
    
    @Binding var baseCurrency: Currencies
    
    @ObservedObject var settingsViewModel = SettingsViewModel()
    
    var body: some View {
        
        NavigationView {
            Form {
                List(settingsViewModel.currencyList, id: \.name) { currency in
                    SettingsItemView(item: currency, function: {
                        settingsViewModel.updateItem(item: currency)
                    })
                }
                .listRowBackground(Color("ColorBackground"))
            }.navigationBarItems(
                
                leading: Button(
                    action: {
                        self.baseCurrency = self.settingsViewModel.changeAllStates(
                            state: true,
                            baseCurrency: baseCurrency
                        )
                    },
                    label: { Text("Select All").foregroundColor(Color("ColorText")) }
                ),
                
                trailing: Button(
                    action: {
                        self.baseCurrency = self.settingsViewModel.changeAllStates(
                            state: false,
                            baseCurrency: baseCurrency
                        )
                    },
                    label: { Text("Deselect All").foregroundColor(Color("ColorText")) }
                )
                
            ).navigationBarTitle("Settings")
        }
    }
}

protocol Effect {

    func asd(newBase: Currencies)
}

#if DEBUG
struct SettingsViewPreviews: PreviewProvider {
    static var previews: some View {
        SettingsView(baseCurrency: .constant(Currencies.EUR))
        SettingsView(baseCurrency: .constant(Currencies.EUR)).preferredColorScheme(.dark)
    }
}
#endif
