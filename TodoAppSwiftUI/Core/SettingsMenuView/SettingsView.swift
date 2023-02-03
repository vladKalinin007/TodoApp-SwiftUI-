//
//  SettingsView.swift
//  TodoAppSwiftUI
//
//  Created by Владислав Калинин on 13.11.2022.
//

import SwiftUI

struct SettingsView: View {
    // MARK: - PROPERTIES
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var iconSettings: IconNames
    
    // MARK: - BODY
    var body: some View {
        NavigationStack {
            VStack (alignment: .center, spacing: 0) {
                // MARK: - FORM
                
                Form {
                    // MARK: - SECTION 1
                    
                    Section(header: Text("Choose the app icon ")) {
                        Picker(selection: $iconSettings.currentIndex, label:
                          Text("App Icons") ) {
                            ForEach(0..<iconSettings.iconNames.count) { index in
//                                HStack {
//                                    Image(uiImage: UIImage(named:
//                                        self.iconSettings.iconNames[index] ?? "Blue") ?? UIImage())
//                                    .resizable()
//                                    .aspectRatio(1, contentMode: .fit)
//                                    .scaledToFit()
////                                    .renderingMode(.original)
//                                    .frame(width: 44, height: 44)
//                                    .cornerRadius(8)
//
//                                    Spacer().frame(width: 8)
//
//                                    Text(self.iconSettings.iconNames[index] ?? "Blue")
//                                        .frame(alignment: .leading)
//                                } //: H-STACK
//                                .scaledToFit()
//                                .padding(3)
                            } //: FOR-EACH-LOOP
                        } //: PICKER
                        .onReceive([self.iconSettings.currentIndex].publisher.first()) {
                            (value) in
                            let index = self.iconSettings.iconNames.firstIndex(of: UIApplication.shared.alternateIconName) ?? 0
                            if index != value {
                                UIApplication.shared.setAlternateIconName(self.iconSettings.iconNames[value]) { error in
                                    if let error = error {
                                        print(error.localizedDescription)
                                    } else {
                                        print("Success")
                                    }
                                }
                            }
                        }
                    } //: SECTION 1
                        .padding(.vertical, 3)
                
                    // MARK: - SECTION 3
                    Section(header: Text("Follow us on social media")) {
                        
                        FormRowLinkView(icon: "globe", color: Color.pink, text: "Website", link: "https://swift.org")
                        FormRowLinkView(icon: "link", color: Color.blue, text: "Twitter", link: "https://swift.org")
                        FormRowLinkView(icon: "play.rectangle", color: Color.green, text: "Courses", link: "https://swift.org")
                        
                    } //: SECTION 3
                    .padding(.vertical, 3)
                    
                    // MARK: - SECTION 4
                    Section(header: Text("About the application")) {
                        FormRowStaticView(icon: "gear", firstText: "Application", secondText: "Todo")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secondText: "iPhone, iPad")
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secondText: "John / Jane")
                        FormRowStaticView(icon: "paintbrush", firstText: "Designer", secondText: "Vlad Kalinin")
                        FormRowStaticView(icon: "flag", firstText: "Version", secondText: "1.0.0")
                    } //: SECTION 4
                    .padding(.vertical, 3)
                } //: FORM
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                
                // MARK: - FOOTER
                
                Text("Copyright © All rights reserved. \nBetter Apps ♡ Less Code")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top, 6)
                    .padding(.bottom, 8)
                    .foregroundColor(Color.secondary)
                
            } //: VStack
            .navigationBarItems(trailing:
            Button {
                self.presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")

            }
            )
            .navigationTitle("Настройки")
            .toolbarBackground(.visible, for: .navigationBar)
            .navigationBarTitleDisplayMode(.inline)
            .background(Color("ColorBackground"))
        } //: NAVIGATION_STACK
    }
}
    // MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(IconNames())
    }
}
