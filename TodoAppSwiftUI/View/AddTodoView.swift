//
//  AddTodoView.swift
//  TodoAppSwiftUI
//
//  Created by Владислав Калинин on 11.11.2022.
//

import SwiftUI

struct AddTodoView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    
    let priorities = ["High", "Normal", "Low"]
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    // MARK: - Todo Name
                    TextField("Todo", text: $name)
                    
                    // MARK: - Todo Priority
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id: \.self) { priority in
                            Text(priority)
                        } //: ForEach
                    } //: Picker
                    .pickerStyle(.segmented)
                    // MARK: - Save button
                    Button {
                        
                    } label: {
                        Text("Save")
                    } //: Button (save)
                } //: Form
                Spacer()
            } //: VStack
            .navigationBarTitle("New Todo ", displayMode: .inline)
            .navigationBarItems(trailing:
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
            } //: Button
          ) //: navigationBarItems
        } //: NavigationView
    }
}

    // MARK: - PREVIEW
struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
