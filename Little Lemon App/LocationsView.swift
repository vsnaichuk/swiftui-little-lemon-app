//
//  LocationsView.swift
//  Little Lemon App
//
//  Created by vsn on 16.03.2023.
//

import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var model:Model
    
    var body: some View {
        VStack {
            LogoView().padding(.top, 50)
            
            Text(model.displayingReservationForm ? "Reservation Details" : "Select a location")
                .padding(.horizontal, 40)
                .padding(.vertical, 8)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
            
            Spacer(minLength: 20)
            
            NavigationView {
                List(model.restaurants, id: \.self) {
                    restaurant in NavigationLink(destination: ReservationFormView()) {
                        RestaurantView(restaurant)
                    }
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                }
                .listStyle(.plain)
            }
        }
        .padding(.horizontal, 20)
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(Model())
    }
}
