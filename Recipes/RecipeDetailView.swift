//
//  RecipeDetailView.swift
//  Recipes
//
//  Created by Biagio Ricci on 12/04/23.
//

import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe
    var body: some View {
        
        ScrollView{
            VStack(spacing: 20){
                
                Text("\(recipe.strMeal)")
                    .font(.title)
                    .fontWeight(.bold)
                
                AsyncImage(url: URL(string: recipe.strMealThumb ?? "N/A")) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                    } else if phase.error != nil {
                        Text("There was an error loading the image.")
                            .foregroundColor(.pink)
                    } else {
                        Text("No photo available")
                            .foregroundColor(.pink)
                    }
                }
                .frame(width: 300, height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 40.0))
                
                Text("Area: \(recipe.strArea)")
                Text("Category: \(recipe.strCategory)")
                
                Text("Ingredients:")
                    .fontWeight(.bold)
                
                VStack(alignment: .leading){
                    Group{
                        Text("First Ingredient: \(recipe.strIngredient1 ?? "") \(recipe.strMeasure1 ?? "")")
                        Text("Second Ingredient: \(recipe.strIngredient2 ?? "") \(recipe.strMeasure2 ?? "")")
                        Text("Third Ingredient: \(recipe.strIngredient3 ?? "") \(recipe.strMeasure3 ?? "")")
                        Text("Fourth Ingredient: \(recipe.strIngredient4 ?? "") \(recipe.strMeasure4 ?? "")")
                        Text("Fifth Ingredient: \(recipe.strIngredient5 ?? "") \(recipe.strMeasure5 ?? "")")
                        Text("Sixth Ingredient: \(recipe.strIngredient6 ?? "") \(recipe.strMeasure6 ?? "")")
                        Text("Seventh Ingredient: \(recipe.strIngredient7 ?? "") \(recipe.strMeasure7 ?? "")")
                        Text("Eightth Ingredient: \(recipe.strIngredient8 ?? "") \(recipe.strMeasure8 ?? "")")
                        Text("Ninth Ingredient: \(recipe.strIngredient9 ?? "") \(recipe.strMeasure9 ?? "")")
                        Text("Tenth Ingredient: \(recipe.strIngredient10 ?? "") \(recipe.strMeasure10 ?? "")")
                    }
                    Group{
                        Text("Eleventh Ingredient: \(recipe.strIngredient11 ?? "") \(recipe.strMeasure11 ?? "")")
                        Text("Twelfth Ingredient: \(recipe.strIngredient12 ?? "") \(recipe.strMeasure12 ?? "")")
                        Text("Thirteenth Ingredient: \(recipe.strIngredient13 ?? "") \(recipe.strMeasure13 ?? "")")
                        Text("Fourteenth Ingredient: \(recipe.strIngredient14 ?? "") \(recipe.strMeasure14 ?? "")")
                        Text("Fifteenth Ingredient: \(recipe.strIngredient15 ?? "") \(recipe.strMeasure15 ?? "")")
                        Text("Sixteenth Ingredient: \(recipe.strIngredient16 ?? "") \(recipe.strMeasure16 ?? "")")
                        Text("Seventeenth Ingredient: \(recipe.strIngredient17 ?? "") \(recipe.strMeasure17 ?? "")")
                        Text("Eighteenth Ingredient: \(recipe.strIngredient18 ?? "") \(recipe.strMeasure18 ?? "")")
                        Text("Nineteenth Ingredient: \(recipe.strIngredient19 ?? "") \(recipe.strMeasure19 ?? "")")
                        Text("Twentieth Ingredient: \(recipe.strIngredient20 ?? "") \(recipe.strMeasure20 ?? "")")
                    }
                }
                Text("Instructions: ")
                    .fontWeight(.bold)
                Text("\(recipe.strInstructions)")
            }
        }
        .padding()
    }
}

/*struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetailView()
    }
}*/
