//
//  TravelerCircles.swift
//  NolaTravelApp
//
//  Created by Thenardo Ardo on 23/05/22.
//

import SwiftUI

struct TravelerCircles: View {
    var body: some View {
        
        let numOfCircles: Int = 4
        
        HStack() {
            ForEach(0..<numOfCircles, id: \.self) { element in
                if element < 3 {
                    ZStack {
                        Image(systemName: "person.circle.fill")
                            .resizable()
                            .foregroundColor(Color.random())
                            .background(.white)
                            .aspectRatio(contentMode: .fit)
                        
                        Circle()
                            .strokeBorder(.white, lineWidth: 2)
                    }
                    .frame(width: 25, height: 25)
                    .cornerRadius(20)
                    .offset(x: element > 0 ? CGFloat(-20 * element) : 0)
                }
            }
            
            if numOfCircles >= 4 {
                ZStack(alignment: .center) {
                    Circle()
                        .fill(Color("light_gray"))
                 
                    Circle()
                        .strokeBorder(.white, lineWidth: 1)
                    
                    Text("+20")
                        .font(.custom(CustomFont.mainBold, size: 10))
                        .foregroundColor(.gray)
                }
                .frame(width: 25, height: 25)
                .offset(x: CGFloat(-20 * 3))
            }
        }
    }
}

struct TravelerCircles_Previews: PreviewProvider {
    static var previews: some View {
        TravelerCircles()
    }
}
