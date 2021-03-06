//
//  ItemView.swift
//  CurrencyConverterCalculator
//
//  Created by Mustafa Ozhan on 06/08/2019.
//  Copyright © 2019 Mustafa Ozhan. All rights reserved.
//
import SwiftUI

struct CalculatorItemView: View {
    
    var item: Currency
    var itemClickEvent: (Currency) -> Void

    var body: some View {
        HStack {
            
            Text(item.value).foregroundColor(Color("ColorText"))
            Text(item.symbol).foregroundColor(Color("ColorText"))
            Spacer()
            Text(item.name).foregroundColor(Color("ColorText"))
            Image(item.name.lowercased())
                .shadow(radius: 3)
            
        }
        .contentShape(Rectangle())
        .onTapGesture {
            itemClickEvent(item)
        }
    }
}

#if DEBUG
struct CalculatorItemViewPreviews: PreviewProvider {
    static var previews: some View {
        CalculatorItemView(item: Currency(), itemClickEvent: {_ in})
            .previewLayout(.fixed(width: 300, height: 60))
            .makeForPreviewProvider()
    }
}
#endif
