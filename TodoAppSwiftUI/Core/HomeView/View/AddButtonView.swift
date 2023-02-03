//
//  AddButtonVIew.swift
//  TodoAppSwiftUI
//
//  Created by Владислав Калинин on 12.11.2022.
//

import SwiftUI

struct AddButtonView: View {
    // MARK: - PROPERTIES
    
    @Binding var showingAddTodoView: Bool
    
    // MARK: - BODY
    var body: some View {
        Button {
            showingAddTodoView.toggle()
        } label: {
            HStack {
                Image(systemName: "plus")
                    .padding(.trailing, -10)
                    .padding(.leading, 50)
//                    .foregroundColor(Color(#colorLiteral(red: 1, green: 0.9895387292, blue: 0.02251920663, alpha: 1)))

                
                Text("Добавить задачу")
                    .padding()
                    .multilineTextAlignment(.center)
                    .overlay {
                        LinearGradient(
                            colors: [Color(#colorLiteral(red: 0, green: 0.1107608194, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.7173244221, green: 0.1764802499, blue: 1, alpha: 1))],
                            startPoint: .leading,
                            endPoint: .trailing
                        ).mask(
                            Text("Добавить задачу")
                                .multilineTextAlignment(.center)
                        )
                    }

                Spacer()
            } //: HSTACK
//            .padding(.bottom, 1)
            .font(.system(size: 22, design: .default))
            .background(.ultraThinMaterial, in: RoundedRectangle(cornerRadius: 12))
            .foregroundColor(Color.blue)
            .shadow(radius: 6)
            .padding()
            
        } //: This_Button
    }
}

    // MARK: - PREVIEW
struct AddButtonView_Previews: PreviewProvider {
    static var previews: some View {
        AddButtonView(showingAddTodoView: .constant(true))
    }
}
