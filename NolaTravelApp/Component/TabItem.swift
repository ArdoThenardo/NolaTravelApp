//
//  TabItem.swift
//  NolaTravelApp
//
//  Created by Thenardo Ardo on 25/05/22.
//

import SwiftUI

struct TabItem: View {
    
    var name: String
    var isSelected: Bool
    
    var body: some View {
        Text(name)
            .font(.custom(CustomFont.mainBold, size: 14))
            .foregroundColor(isSelected ? Color("blue") : .gray)
            .padding(10)
            .background(isSelected ? Color("light_blue") : .white.opacity(0))
            .cornerRadius(14)
    }
}

struct TabItem_Previews: PreviewProvider {
    static var previews: some View {
        TabItem(name: "Overview", isSelected: true)
    }
}
