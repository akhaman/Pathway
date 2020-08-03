//
//  MenuAPI.swift
//  Home
//
//  Created by macOS on 15.07.2020.
//  Copyright © 2020 Ruslan Akhmadeev. All rights reserved.
//

import UIKit

protocol MenuDataSource {
    func menu() -> String
}

class MenuAPI {
    static var dataSource: MenuDataSource?
    
    static func getMenu() -> [Menu] {
        
        let profileImage = getProfileImage() ?? #imageLiteral(resourceName: "Profile")
        let task = getTask() ?? "do nothing"
        let date = updateDatesOfInsurance() ?? "-"
        let name = getName() ?? "Hey, User!"
        let cost = getCosts()
        
        let menu = [
            Menu(heading: "Profile", info: name, image: profileImage),
            Menu(heading: "Weather", info: "It's rainy :(", image:  #imageLiteral(resourceName: "Weather")),
            Menu(heading: "ToDoList", info: "Task for today is " + task, image:  #imageLiteral(resourceName: "toDo")),
            Menu(heading: "Total costs:", info: cost, image:  #imageLiteral(resourceName: "Costs-2")),
            Menu(heading: "Technical inspection info", info: "Days from last T.I. = " + date, image:  #imageLiteral(resourceName: "TO"))
        ]
        return menu
    }
    
    private static func updateDatesOfInsurance() -> String? {
        if let date = UserDefaults.standard.string(forKey: "maintenance") {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM.yyyy"
            let dateOfM = dateFormatter.date(from:date)!
            let dateOfNow = Date()
            let components = Calendar.current.dateComponents([.day], from: (dateOfM), to: dateOfNow)
            let result = String(components.day!)
            return result
        } else {return nil}
    }
    
    private static func getName() -> String? {
        if let name = UserDefaults.standard.string(forKey: "name") {
            return "Hey, " + name + "!"
        } else {return nil}
    }
    
    private static func getCosts() -> String {
        return String(UserDefaults.standard.double(forKey: "total")) + "$"
    }
    
    private static func getTask() -> String? {
        return loadChecklistItems()
    }
    
    private static func getProfileImage() -> UIImage? {
        let image: UIImage
        let data = UserDefaults.standard.value(forKey: "CarPhoto") as? NSData
        if let data = data {
            image = UIImage(data: data as Data)!
            return image
        }
        return nil
    }
    
    private static func loadChecklistItems() -> String? {
        
        let path = dataFilePath()
        let items: [ToDoListItem]
        if let data = try? Data(contentsOf: path) {
            let decoder = PropertyListDecoder()
            do {
                items = try decoder.decode([ToDoListItem].self, from: data)
                var i = 0
                
                while i < items.count && !items[i].checked {
                    i += 1
                }
                if i > 0 {
                    return items[Int.random(in: 0..<i)].text
                } else {
                    return nil
                }
            } catch {
                print("Error decoding item array: \(error.localizedDescription)")
            }
        }
        return nil
    }
    
    private static func documentDirectory() -> URL {
        
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    private static func dataFilePath() -> URL {
        
        return documentDirectory().appendingPathComponent("ToDoList.plist")
    }
}

