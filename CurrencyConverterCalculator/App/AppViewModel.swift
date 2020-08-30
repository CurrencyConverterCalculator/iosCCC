//
//  AppViewModel.swift
//  CurrencyConverterCalculator
//
//  Created by Mustafa Ozhan on 13/08/2020.
//  Copyright © 2020 Mustafa Ozhan. All rights reserved.
//

import Foundation

final class AppViewModel: ObservableObject {
    
    // MARK: SEED
    @Published private(set) var state: AppState
    var data = AppData()
    
    init() {
        self.state = AppState(isFirstRun: data.defaults.firstRun)
    }
}
