//
//  SideMenuView.swift
//  TodoAppSwiftUI
//
//  Created by Владислав Калинин on 13.11.2022.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color(#colorLiteral(red: 0, green: 0.09241304729, blue: 0.8343478116, alpha: 1)), Color(#colorLiteral(red: 0.6682155339, green: 0.165887677, blue: 0.94065225, alpha: 1))],
                startPoint: .leading,
                endPoint: .trailing)
                .ignoresSafeArea()
//            VStack {
//                SideMenuHeaderView()
//
//                ForEach(<#array#>, id: \.self) { <#item#> in
//
//                }
//                .foregroundColor(.white)
//                Spacer()
//            }
        }
//        .navigationBarBackButtonHidden(true)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}
