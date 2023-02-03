//
//  NavigationBarView.swift
//  TodoAppSwiftUI
//
//  Created by Владислав Калинин on 13.11.2022.
//

import SwiftUI

struct NavigationBarView: View {
    // MARK: - PROPERTIES
    
    
    // MARK: - BODY
    var body: some View {
        HStack {
            Button {
                
            } label: {
                Image(systemName: "list.bullet")
                    .font(.title)
                    .foregroundColor(.black)
            }
            
            Spacer()
            
//            Text("Список дел")
//                .font(.title)
            
            Spacer()
            
            Button {
                
            } label: {
                Image(systemName: "gear")
                    .font(.title)
                    .foregroundColor(.black)

            }
        } // MARK: - HStack
    }
}

    // MARK: - PREVIEW
struct NavigationBarView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarView()
    }
}
