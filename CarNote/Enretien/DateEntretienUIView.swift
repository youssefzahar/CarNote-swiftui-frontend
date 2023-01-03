//
//  DateEntretienUIView.swift
//  carNote
//
//  Created by youssef-mariem on 21/11/2022.
//

import SwiftUI

struct DateEntretienUIView: View {
  //  @State private var date = Date()
    @ObservedObject var viewModel = EntretienViewModel()
    @State private var title=""
    @State private var description=""
    @State private var date = Date()

    let pickdate  : LocalizedStringKey = "Pick a Date !"
    let dateentretien  : LocalizedStringKey = "Date entretien"
    let Title  : LocalizedStringKey = "Title : "
    let Description  : LocalizedStringKey = "Description : "
    let Add_Entretien  : LocalizedStringKey = "Add Entretien"

    var body: some View {
        
        VStack{
            Text(pickdate).font(.system(size: 34, design: .rounded)).bold().padding().foregroundColor(.white)
            
            Spacer()
            HStack{
                Form{
                    
                    
                    
                    DatePicker(dateentretien, selection: $viewModel.date,displayedComponents:[.date] )
                        .datePickerStyle(GraphicalDatePickerStyle())
                }
            }
            
            ScrollView{
                HStack{
                    Image(systemName: "car").foregroundColor(.blue)
                        .foregroundColor(.gray).font(.headline)
                    TextField(Title, text: $viewModel.title)
                        .padding()
                    .frame(width: 300, height: 30)}
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                
                HStack{
                    Image(systemName: "car").foregroundColor(.blue)
                        .foregroundColor(.gray).font(.headline)
                    TextField(Description, text: $viewModel.description)
                        .padding()
                    .frame(width: 300, height: 30)}
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray,lineWidth: 1))
                
                
                NavigationLink(destination: CarListView()){
                    Text(Add_Entretien).foregroundColor(.blue)
                }.simultaneousGesture(TapGesture().onEnded{
                    viewModel.AddEntretien(title:viewModel.title, description:viewModel.description, date: viewModel.date, owned_by: UserViewModel.currentUser?._id ?? "")
                })
                Button(Add_Entretien, action: {
                    
                    viewModel.AddEntretien(title:viewModel.title, description:viewModel.description, date: viewModel.date, owned_by: UserViewModel.currentUser?._id ?? "")

                }
                )
                .foregroundColor(.white)
                .frame(width: 300, height: 50)
                .background(Color.blue)
                .cornerRadius(10)
                
                
            }}}}

struct DateEntretienUIView_Previews: PreviewProvider {
    static var previews: some View {
        DateEntretienUIView()
    }
}
