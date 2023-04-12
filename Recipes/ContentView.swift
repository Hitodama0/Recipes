//
//  ContentView.swift
//  Recipes
//
//  Created by Biagio Ricci on 12/04/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    var body: some View {
        NavigationView {
            
            ScrollView{
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.recipes?.meals ?? [], id: \.idMeal) {
                        recipe in NavigationLink {
                            RecipeDetailView(recipe: recipe)
                        } label: {
                            VStack{
                                AsyncImage(url: URL(string: recipe.strMealThumb ?? "N/A")) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFit()
                                    } else if phase.error != nil {
                                        Text("There was an error loading the image.")
                                            .foregroundColor(.pink)
                                    } else {
                                        ProgressView()
                                    }
                                }
                                .frame(width: 150, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 25.0))
                                
                                HStack{
                                    Text("\(recipe.strMeal)")
                                    Text("\(recipe.strArea)")
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("Recipe")
            .onAppear {
                viewModel.fetch()
            }
            .preferredColorScheme(.dark)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
