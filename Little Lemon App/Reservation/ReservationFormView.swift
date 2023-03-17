//
//  ReservationFormView.swift
//  Little Lemon App
//
//  Created by vsn on 16.03.2023.
//

import SwiftUI

struct ReservationFormView: View {
    private var restaurant:RestaurantLocation

    @EnvironmentObject var model:Model
    @State var showFormInvalidMessage = false
    @State var errorMessage = ""

    @State var reservationDate = Date()
    @State var party = 1
    @State var specialRequests = ""
    @State var customerName = ""
    @State var customerPhoneNumber = ""
    @State var customerEmail = ""

    init(_ restaurant: RestaurantLocation) {
        self.restaurant = restaurant
    }

    var body: some View {
        VStack {
            Form {
                RestaurantView(restaurant)

                HStack {
                    VStack(alignment: .leading) {
                        Text("PARTY")
                        TextField("",
                                  value: $party,
                                  formatter: NumberFormatter())
                        .keyboardType(.numberPad)
                        .onChange(of: party) { value in
                            if value == 0 { party = 1 }
                        }
                    }

                    VStack {
                        DatePicker(selection: $reservationDate, in: Date()...,
                                   displayedComponents: [.date, .hourAndMinute]) {}
                    }
                }
                .padding(.vertical, 20)

                HStack{
                    Text("NAME: ")
                        .font(.subheadline)
                    TextField("Your name...",
                              text: $customerName)

                }

                HStack{
                    Text("PHONE: ")
                        .font(.subheadline)

                    TextField("Your phone number...",
                              text: $customerPhoneNumber)
                    .textContentType(.telephoneNumber)
                    .keyboardType(.phonePad)
                }

                HStack{
                    Text("E-MAIL: ")
                        .font(.subheadline)
                    TextField("Your e-mail...",
                              text: $customerEmail)
                    .keyboardType(.emailAddress)
                    .textContentType(.emailAddress)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                }
                
                TextField("add any special request (optional)",
                          text: $specialRequests,
                          axis:.vertical)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 20)
                        .stroke(.gray.opacity(0.2)))
                .lineLimit(6)
                .padding(.vertical, 20)
                
                Button("CONFIRM RESERVATION", action: {
                    // TODO: Add form validation
                })
                .padding(.vertical, 10)
                .padding(.horizontal, 30)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(20)
            }
            .scrollContentBackground(.hidden)
        }
        .onAppear {
            model.displayingReservationForm = true
        }
        .onDisappear {
            model.displayingReservationForm = false
        }
    }
}

struct ReservationFormView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleRestaurant = RestaurantLocation(city: "Las Vegas", neighborhood: "Downtown", phoneNumber: "(702) 555-9898")

        ReservationFormView(sampleRestaurant).environmentObject(Model())
    }
}
