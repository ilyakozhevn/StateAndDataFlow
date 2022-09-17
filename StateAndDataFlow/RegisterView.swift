//
//  RegisterView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 14.09.2022.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @EnvironmentObject private var user: UserManager
    
    var body: some View {
        VStack {
            ZStack(alignment: .trailing){
                Text(name.count.formatted()).padding(.trailing)
                    .foregroundColor(name.count > 2 ? .green : .red)
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
            }
            
            Button(action: name.count > 2 ? registerUser : {}) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
                .foregroundColor(name.count > 2 ? .blue : .gray)
            }
        }
    }
    
    private func registerUser() {
        if !name.isEmpty {
            user.name = name
            user.isRegister.toggle()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
