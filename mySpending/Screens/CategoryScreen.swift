//
//  CategoryScreen.swift
//  mySpending
//
//  Created by Marvellous Dirisu on 05/02/2024.
//

import SwiftUI

struct CategoryScreen: View {
    @State private var isAlertShowing: Bool = false
    @State private var newCategory: String = ""
    @State private var newCategoryColor = Color(.sRGB, red: 0.8, green: 0.9, blue: 0.5)
    @State private var categories: [Category] = [
        Category(id: 0, name: "Food", color: .blue),
        Category(id: 1, name: "Clothes", color: .red),
        Category(id: 2, name: "Shelter", color: .green),
    ]
    
    func handleSubmit() {
        if newCategory.count > 0 {
            categories.append(Category(
                id: categories.count,
                name: newCategory,
                color: newCategoryColor
            ))
            newCategory = ""
        } else {
            isAlertShowing = true
        }
    }
    
    // deletes an item on the list
    func handleDelete(at offsets: IndexSet) {
        categories.remove(atOffsets: offsets)
    }
    
    
    var body: some View {
        VStack{
            List {
                ForEach(categories) { category in
                HStack{
                    Circle()
                        .frame(width: 12)
                        .foregroundColor(category.color)
                        .border(.gray, width: 1)
                        .cornerRadius(6)
                    Text(category.name)
                    }
                }
                .onDelete(perform: handleDelete)
            }
        
        Spacer()
        
        HStack(spacing: 15) {
            ColorPicker("", selection: $newCategoryColor, supportsOpacity: false)
                .labelsHidden()
            
            ZStack(alignment: .trailing) {
                TextField("Enter Category: ", text: $newCategory)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onSubmit {
                        handleSubmit()
                    }
                
                if newCategory.count > 0 {
                    Button {
                        newCategory = ""
                    } label: {
                        Label("Cancel", systemImage: "x.circle.fill")
                            .labelStyle(.iconOnly)
                            .foregroundColor(.gray)
                            .padding(.trailing, 6)
                    }
                }
            }
            
            Button {
                handleSubmit()
                
            } label: {
                Label("Send", systemImage: "paperplane.circle.fill")
                    .padding(3)
                    .labelStyle(.iconOnly)
                    .background(.blue)
                    .foregroundColor(.white)
                    
            }
            .alert("Must Provide a Category", isPresented: $isAlertShowing) {
                Button("OK", role: .cancel) {
                    isAlertShowing = false
                }
            }
        }
        .padding(.horizontal, 16)
        //.toolbar(.hidden, for: .tabBar)
    }
    }
}

struct CategoryScreen_Previews: PreviewProvider {
    static var previews: some View {
        CategoryScreen()
    }
}
