//
//  SelectionView.swift
//  CurrencyConverterCalculator
//
//  Created by Mustafa Ozhan on 16/08/2019.
//  Copyright © 2019 Mustafa Ozhan. All rights reserved.
//
import SwiftUI

struct BarItemView: View {
    var item: Currency
    
    var body: some View {
        HStack {
            
            Image(item.name.lowercased()).shadow(radius: 3)
            Text(item.name)
                .frame(width: 45)
                .foregroundColor(Color("ColorText"))
            Text(item.longName)
                .font(.footnote)
                .foregroundColor(Color("ColorText"))
            Text(item.symbol)
                .font(.footnote)
                .foregroundColor(Color("ColorText"))
            Spacer()
            
        }
        .contentShape(Rectangle())
        .lineLimit(1)
    }
}

#if DEBUG
struct BarItemViewPreviews: PreviewProvider {
    static var previews: some View {
        BarItemView(item: Currency())
            .makeForPreviewProvider()
            .previewLayout(.fixed(width: 300, height: 60))
            
    }
}
#endif
