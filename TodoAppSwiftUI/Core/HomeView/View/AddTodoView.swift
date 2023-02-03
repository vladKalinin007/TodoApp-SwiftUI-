//
//  AddTodoView.swift
//  TodoAppSwiftUI
//
//  Created by Владислав Калинин on 11.11.2022.
//

import SwiftUI

struct AddTodoView: View {
    // MARK: - PROPERTIES
    
    // MARK: Global Environment
    @Environment(\.managedObjectContext) var managedObjectContext
    @Environment(\.presentationMode) var presentationMode
    // MARK: Local  States
    @State private var name: String = ""
    @State private var priority: String = "Normal"
    @State private var errorShowing: Bool = false
    @State private var errorTitle: String = ""
    @State private var errorMessage: String = ""
    
    let priorities = ["High", "Normal", "Low"]
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                VStack (alignment: .leading, spacing: 20) {
                    // MARK: - Todo Name
                    
                    HStack {
                        Image(systemName: "circle")

                        TextField("Добавить задачу", text: $name)
                        
                    }
                    .padding()
                    .font(.system(size: 22, design: .default))
                    .background(Color(UIColor.tertiarySystemFill))
                    .foregroundColor(.black)
                    .cornerRadius(9)
                    .shadow(radius: 0.5)
                    
                    // MARK: - Todo Priority
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id: \.self) { priority in
                            Text(priority)
                        } //: FOR EACH
                    } //: PICKER
                    .pickerStyle(.segmented)
                    // MARK: - Save button
                    Button {
                        if self.name != "" {
                            let todo = Todo(context: self.managedObjectContext)
                            todo.name = self.name
                            todo.priority = self.priority
                            
                            do {
                                try self.managedObjectContext.save()
                                
                            } catch {
                                print("DEBUG: Error \(error)")
                            }
                        } else {
                            self.errorShowing = true
                            self.errorTitle = "Invalid name"
                            self.errorMessage = "Make sure to enter something for \nthe new todo item."
                            return
                        } //: IF-ELSE STATEMENT
                        self.presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Сохранить")
//                            .font(.system(size: 24, weight: .bold, design: .default))
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .overlay {
                                LinearGradient(
                                    colors: [Color(#colorLiteral(red: 0, green: 0.1107608194, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.7173244221, green: 0.1764802499, blue: 1, alpha: 1))],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                ).mask(
                                    Text("Сохранить")
                                        .multilineTextAlignment(.center)
                                        .shadow(radius: 1)
                                )
                            }
                            .background()
                            .cornerRadius(9)
                            .foregroundColor(.white)
                            .shadow(radius: 3)
                            .font(.system(size: 24, weight: .bold, design: .default))
                    } //: SAVE BUTTON
                } //: VSTACK
                .padding(.horizontal)
                .padding(.vertical, 30)
                Spacer()
            } //: VSTACK
            .navigationBarTitle("New Todo ", displayMode: .inline)
            .navigationBarItems(trailing:
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
            } //: DISMISS BUTTON
          ) //: NAVIGATION BAR ITEMS
            .alert(isPresented: $errorShowing) {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            }
        } //: NAVIGATION VIEW
    }
}

    // MARK: - PREVIEW
struct AddTodoView_Previews: PreviewProvider {
    static var previews: some View {
        AddTodoView()
    }
}
