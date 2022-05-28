//
//  ReviewItem.swift
//  NolaTravelApp
//
//  Created by Thenardo Ardo on 27/05/22.
//

import SwiftUI

struct ReviewItem: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                HStack(alignment: .center, spacing: 8) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.random())
                        .frame(width: 28, height: 28)
                    
                    Text("User\(Int.random(in: 100..<999))")
                        .font(.custom(CustomFont.mainBold, size: 16))
                }
                
                Spacer()
                
                HStack(alignment: .center, spacing: 3) {
                    Image(systemName: "star.fill")
                        .font(.title3)
                        .foregroundColor(Color("blue"))
                    
                    Text("\(String(format: "%.1f", Float.random(in: 3...5)))")
                        .font(.custom(CustomFont.mainBold, size: 18))
                }
            }
            
            VStack(alignment: .leading, spacing: 18) {
                Text(SampleData.sampleShortText)
                    .font(.custom(CustomFont.mainRegular, size: 16))
                    .lineSpacing(5)
                
                Text("December 2022")
                    .font(.custom(CustomFont.mainRegular, size: 14))
                    .foregroundColor(.gray)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(.gray.opacity(0.1))
        .cornerRadius(16)
    }
}

struct ReviewItem_Previews: PreviewProvider {
    static var previews: some View {
        ReviewItem()
    }
}
