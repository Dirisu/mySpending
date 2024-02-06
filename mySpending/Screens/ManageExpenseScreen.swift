//
//  ManageExpenseScreen.swift
//  mySpending
//
//  Created by Marvellous Dirisu on 05/02/2024.
//

import SwiftUI

struct ManageExpenseScreen: View {
    
    var body: some View {
        NavigationView {
                List {
                    NavigationLink {
                        CategoryScreen()
                    } label: {
                        Text("View Expense Categories")
                    }
                    Button(role: .destructive) {
                        //
                    } label: {
                        Text("Erase Data")
                    }

                }
            .navigationTitle("Categories")
        }
        
    }
}

struct ManageExpenseScreen_Previews: PreviewProvider {
    static var previews: some View {
        ManageExpenseScreen()
    }
}
