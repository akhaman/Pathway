//
//  StoryDetailsData.swift
//  Home
//
//  Created by macOS on 17.07.2020.
//  Copyright © 2020 Ruslan Akhmadeev. All rights reserved.
//
import UIKit

struct StoryDetailsData {
    var name: String = ""
    var image: UIImage
    var content: [UIImage] = []
}

class DetailedStoryAPI {
    static func getDetailedStories() -> [StoryDetailsData] {
        let data = [
            StoryDetailsData(name: "App", image: #imageLiteral(resourceName: "AboutApp"), content: [#imageLiteral(resourceName: "Без названия 2"), #imageLiteral(resourceName: "Home"), #imageLiteral(resourceName: "Costs-1"), #imageLiteral(resourceName: "ToDo"), #imageLiteral(resourceName: "Profile -1")]),
            StoryDetailsData(name: "Film", image: #imageLiteral(resourceName: "CarsAndFilms"), content: [#imageLiteral(resourceName: "Film-1")]),
            StoryDetailsData(name: "CarPlay", image: #imageLiteral(resourceName: "CarPlay"), content: [#imageLiteral(resourceName: "Без названия 4")]),
            StoryDetailsData(name: "Covid", image: #imageLiteral(resourceName: "Covid"), content: [#imageLiteral(resourceName: "photo_2020-07-17 18.13.45"), #imageLiteral(resourceName: "photo_2020-07-17 18.13.47"), #imageLiteral(resourceName: "photo_2020-07-17 18.13.48"), #imageLiteral(resourceName: "photo_2020-07-17 18.13.49"), #imageLiteral(resourceName: "photo_2020-07-17 18.13.50")]),
            StoryDetailsData(name: "Control", image: #imageLiteral(resourceName: "Control"), content: [#imageLiteral(resourceName: "Costs")]),
        ]
        return data
    }
}

