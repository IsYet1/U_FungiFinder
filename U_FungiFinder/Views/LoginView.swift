//
//  LoginView.swift
//  FungiFinder
//
//  Created by Mohammad Azam on 11/3/20.
//

import SwiftUI

struct LoginView: View {
    
    @State var isPresented: Bool = false
    @State var isActive: Bool = false
    
    @State private var email: String = ""
    @State private var password: String = ""
        
    var body: some View {
        VStack {
            Image("mushroom")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .padding(.bottom, 20)
            
            TextField("Username", text: $email)
                .padding(.bottom, 20)
            
            SecureField("Password", text: $password)
               
            Spacer()
            
            Button("Login") {
               
            }
            .buttonStyle(PrimaryButtonStyle())
            .padding(.bottom, 10)
            
            Button("Create account") {
                isPresented = true
            }.buttonStyle(SecondaryButtonStyle())
           
            Spacer()
           
            
            NavigationLink(
                destination: FungiListView(),
                isActive: $isActive,
                label: {
                    EmptyView()
                })
            
        }
        .padding()
        .defaultBackgroundView()
        .sheet(isPresented: $isPresented, content: {
            RegisterView() 
        })
        .navigationTitle("Fungi Finder")
        .embedInNavigationView()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
