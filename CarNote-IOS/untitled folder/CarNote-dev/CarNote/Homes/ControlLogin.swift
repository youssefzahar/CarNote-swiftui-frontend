//
//  ControlLogin.swift
//  carNote
//
//  Created by youssef-mariem on 12/12/2022.
//

import SwiftUI

struct ControlLogin: View {
   
    @ObservedObject var viewModel = UserViewModel()

   
    var body: some View {
       
        if UserViewModel.currentUser?.role == "User" {
            HomeUser()
        } else if UserViewModel.currentUser?.role == "Vendeur" {
            HomeVendeur()
        }
         
            
    }
   

}

struct ControlLogin_Previews: PreviewProvider {
    static var previews: some View {
        ControlLogin()
    }
}
