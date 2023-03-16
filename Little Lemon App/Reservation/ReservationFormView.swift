//
//  ReservationFormView.swift
//  Little Lemon App
//
//  Created by vsn on 16.03.2023.
//

import SwiftUI

struct ReservationFormView: View {
    
    @EnvironmentObject var model:Model
    
    var body: some View {
        VStack {
           Text("ReservationForm")
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
        ReservationFormView().environmentObject(Model())
    }
}
