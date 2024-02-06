//
//  ContentView.swift
//  mySpending
//
//  Created by Marvellous Dirisu on 02/02/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                ExpenseScreen()
                    .badge(2)
                .tabItem{
                    Label("My Expenses", systemImage: "bag.fill.badge.minus")
                }
                
                ReportScreen()
                    .tabItem {
                        Label("Expense Summary", systemImage: "chart.bar.xaxis")
                    }
                
                AddExpenseScreen()
                    .tabItem {
                        Label("Add Expense", systemImage: "folder.fill.badge.plus")
                    }
                ManageExpenseScreen()
                    .badge("-")
                    .tabItem {
                        Label("Settings", systemImage: "folder.fill.badge.gearshape")
                    }
                
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
