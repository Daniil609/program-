//
//  Model.swift
//  Kyrsach
//
//  Created by Tomashik Daniil on 5/21/20.
//  Copyright © 2020 Tomashik Daniil. All rights reserved.
//

import Foundation

var ToDoItems:[[String:Any]] {
    set{
        UserDefaults.standard.set(newValue, forKey: "ToDoDataKey")
        UserDefaults.standard.synchronize()
    }
    get{
       if let array = UserDefaults.standard.array(forKey: "ToDoDataKey") as? [[String:Any]]{
              return array
          }else{
              return  []
          }
    }
}

func AddItem(NameItem: String, isCpmpleted: Bool = false){
    ToDoItems.append(["Name" : NameItem,"isCompleted": isCpmpleted])

}

func RemoveItem(at Index:Int){
    ToDoItems.remove(at:Index)

}

func moveItem(fromIndex:Int,toIndex:Int){
    let from = ToDoItems[fromIndex]
     ToDoItems.remove(at: fromIndex)
     ToDoItems.insert(from, at: toIndex)
}

func ChangeState(at Item:Int)->Bool{
    ToDoItems[Item]["isCompleted"] = !(ToDoItems[Item]["isCompleted"] as! Bool)

    return ToDoItems[Item]["isCompleted"] as! Bool
    
}


