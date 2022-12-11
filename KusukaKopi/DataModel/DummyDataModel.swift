//
//  DummyDataModel.swift
//  KusukaKopi
//
//  Created by Alfindi Abdillah Farizky on 19/10/22.
//

import Foundation
import SwiftUI

struct DummyDataModel: Identifiable{
    var id = UUID()
    var title: String
    var subtitle: String
    var rating: String
    var brewtime_img: String
    var brewtime: String
    var dose_img: String
    var dose: String
    var water_img: String
    var water: String
    var temperature_img: String
    var temperature: String
}

extension DummyDataModel{
   static var dummyData: [DummyDataModel] {
    return [
        DummyDataModel(title: "Nama Recipe",
                       subtitle: "Nama Beans",
                       rating: "Rating",
                       brewtime_img: "brewTime",
                       brewtime: "Brew Time",
                       dose_img: "dose",
                       dose: "Dose",
                       water_img: "water",
                       water: "Water Total",
                       temperature_img: "temp",
                       temperature: "Temperature"
                      ),
        DummyDataModel(title: "Nama Recipe2",
                       subtitle: "Nama Beans2",
                       rating: "Rating2",
                       brewtime_img: "brewTime",
                       brewtime: "Brew Time2",
                       dose_img: "dose",
                       dose: "Dose2",
                       water_img: "water",
                       water: "Water Total2",
                       temperature_img: "temp",
                       temperature: "Temperature2"
                      ),
        DummyDataModel(title: "Nama Recipe3",
                       subtitle: "Nama Beans3",
                       rating: "Rating",
                       brewtime_img: "brewTime",
                       brewtime: "Brew Time3",
                       dose_img: "dose",
                       dose: "Dose3",
                       water_img: "water",
                       water: "Water Total3",
                       temperature_img: "temp",
                       temperature: "Temperature3"
                      )
    ]
    }
}
