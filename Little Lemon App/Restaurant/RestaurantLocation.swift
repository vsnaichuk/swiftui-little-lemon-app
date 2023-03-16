//
//  RestaurantLocation.swift
//  Little Lemon App
//
//  Created by vsn on 16.03.2023.
//

import Foundation

struct RestaurantLocation:Hashable {
  let city:String
  let neighborhood:String
  let phoneNumber:String
  
  init(city:String = "",
       neighborhood:String = "",
       phoneNumber:String = "") {
      
    self.city = city
    self.neighborhood = neighborhood
    self.phoneNumber = phoneNumber
  }
}
