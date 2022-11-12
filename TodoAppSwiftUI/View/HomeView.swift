//
//  HomeView.swift
//  TodoAppSwiftUI
//
//  Created by Владислав Калинин on 11.11.2022.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTIES
    
    @State private var showingAddTodoView: Bool = false
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            List(0 ..< 5) { item in
                Text("Hello, World!")
            } //: List
            .navigationBarTitle("Todo", displayMode: .inline)
            .navigationBarItems(trailing:
                                    
            Button {
                showingAddTodoView.toggle()
            } label: {
                Image(systemName: "plus")
            } //: ADD BUTTON
                .sheet(isPresented: $showingAddTodoView) {
                    AddTodoView()
                } //: sheet
          ) //: navigationBarItems
        } //: NavigationView
    }
}
    // MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
