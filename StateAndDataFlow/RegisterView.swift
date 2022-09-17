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
    
    private var nameIsCorrect: Bool { name.count > 2 }
    
    var body: some View {
        VStack {
            ZStack(alignment: .trailing){
                Text(name.count.formatted()).padding(.trailing)
                    .foregroundColor(nameIsCorrect ? .green : .red)
                TextField("Enter your name", text: $name)
                    .multilineTextAlignment(.center)
            }
            
            Button(action: nameIsCorrect ? registerUser : {}) {
                HStack {
                    Image(systemName: "checkmark.circle")
                    Text("OK")
                }
                .foregroundColor(nameIsCorrect ? .blue : .gray)
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
