//
//  MealModel.swift
//  Recipes
//
//  Created by Biagio Ricci on 12/04/23.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var recipes: Meals?
    func fetch() {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/search.php?s=") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let recipes = try JSONDecoder().decode(Meals.self, from: data)
                DispatchQueue.main.async {
                    self.recipes = recipes
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
