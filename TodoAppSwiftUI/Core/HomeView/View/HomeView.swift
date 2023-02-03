//
//  HomeView.swift
//  TodoAppSwiftUI
//
//  Created by Владислав Калинин on 11.11.2022.
//

import SwiftUI

struct HomeView: View {
    // MARK: - PROPERTIES
    
    @FetchRequest(entity: Todo.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Todo.name, ascending: true)]) var todos: FetchedResults<Todo>
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var showingAddTodoView: Bool = false
    @State private var showingSettingsView: Bool = false
    @State private var showingSideMenuView: Bool = false
    @EnvironmentObject var iconSettings: IconNames
    
    
    // MARK: - BODY
    
    var body: some View {
        VStack (spacing: 0) {
            NavigationStack {
                mainView
                .sheet(isPresented: $showingAddTodoView) {
                    AddTodoView()
                        .environment(\.managedObjectContext, self.managedObjectContext)
                        .presentationDetents([.fraction(0.38)])
                } //: SHEET
                .overlay(
                    ZStack {
                        AddButtonView(showingAddTodoView: $showingAddTodoView)
                    } //: ZSTACK
                        .padding(.bottom, 5)
                    , alignment: .bottomTrailing
                ) //: OVERLAY
                .toolbarBackground(.visible, for: .navigationBar)
                .navigationBarTitleDisplayMode(.inline)
            } //: NAVIGATION_VIEW
        } //: NAVIGATION VIEW
    } //: BODY
    
    var mainView: some View {
        ZStack {
            listView
            .navigationBarTitle("Todo")
            .navigationBarItems(
                leading: menuButton,
                trailing: settingsButton)
            
            // MARK:  EMPTY-LIST-VIEW
            
            if todos.count == 0 {
                EmptyListView()
            } //: IF_STATEMENT

        } //: ZSTACK
    }
    var listView: some View {
        List {
            ForEach(self.todos, id: \.self) { todo in
                HStack {
                    Text(todo.name ?? "Unknown")
                    Spacer()
                    Text(todo.priority ?? "Unknown")
                } //: HSTACK
            } //: FOR_EACH
            .onDelete(perform: deleteTodo)
        } //: LIST
    }
    var settingsButton: some View {
        Button {
            self.showingSettingsView.toggle()
        } label: {
            Image(systemName: "paintbrush")
                .imageScale(.large)
        } //: SETTINGS BUTTON
        .fullScreenCover(isPresented: $showingSettingsView) {
            SettingsView()
                .environmentObject(self.iconSettings)
                .environment(\.managedObjectContext, self.managedObjectContext)
        }
    }
    var menuButton: some View {
        Button {
            self.showingSideMenuView.toggle()
        } label: {
            Image(systemName: "list.bullet.circle")
                .imageScale(.large)
        }
            .fullScreenCover(isPresented: $showingSideMenuView) {
                SideMenuView()
                    .environment(\.managedObjectContext, self.managedObjectContext)
            }
    }
    
    // MARK: - FUNCTIONS
    
    private func deleteTodo(offsets: IndexSet) {
        withAnimation {
            offsets.map { todos[$0] }.forEach(managedObjectContext.delete)
                
            do {
                try managedObjectContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            } //: DO-CATCH
        } //: FOR_IN LOOP
    } //: FUNC DELETE_TODO
    
} //: HOME VIEW

    // MARK: - PREVIEW
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.shared.container.viewContext
        return HomeView()
            .environment(\.managedObjectContext, context)
            .environmentObject(IconNames())
    }
}
