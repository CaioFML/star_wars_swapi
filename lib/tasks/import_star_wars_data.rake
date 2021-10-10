namespace :import_star_wars_data do
  desc "Import all data from swapi star wars API"
  task all: :environment do
    Rake::Task["import_star_wars_data:planets"].invoke
    Rake::Task["import_star_wars_data:species"].invoke
    Rake::Task["import_star_wars_data:starships"].invoke
    Rake::Task["import_star_wars_data:people"].invoke
  end

  desc "Import planets data from swapi star wars API"
  task planets: :environment do
    StarWars::ImportPlanets.call

    puts "Planets was successfully imported"
  end

  desc "Import species data from swapi star wars API"
  task species: :environment do
    StarWars::ImportSpecies.call

    puts "Species was successfully imported"
  end

  desc "Import starships data from swapi star wars API"
  task starships: :environment do
    StarWars::ImportStarships.call

    puts "Starships was successfully imported"
  end

  desc "Import people data from swapi star wars API"
  task people: :environment do
    StarWars::ImportPeople.call

    puts "People was successfully imported"
  end
end
