class PersonDecorator < ApplicationDecorator
  WOOKIE_WORDS = %w[
    youw ahuma ooma ga gwyaaaag yuh ur wyaaaaaa kabukk kabukk ma roo wua hnn-rowr mumwa muaa
    kabukk mumwa Gwyaaaag gwyaaaag roooarrgh ga wyogg youw wua muaa ma
  ].freeze

  def introduction
    "Hello! I'm #{name}. #{characteristics_intro}. My homeworld is #{homeworld.name},"\
      " I was born in the year #{birth_year}"\
      "#{starships_intro}"
  end

  def wookie_introduction
    introduction.split.map { |_word| WOOKIE_WORDS.sample }.join(" ").capitalize
  end

  private

  def starships_intro
    starships_sentence = starships&.map(&:name)&.compact&.to_sentence

    starships_sentence.present? ? " and I've piloted #{starships_sentence}." : "."
  end

  def characteristics_intro
    if specie_intro.present?
      "#{specie_intro}, my weight is #{mass} kg and my height is #{height} cm"
    else
      "My weight is #{mass} kg and my height is #{height} cm"
    end
  end

  def specie_intro
    species_sentence = species&.map(&:name)&.compact&.to_sentence

    "I'm #{indefinite_articlerize(species_sentence)}" if species_sentence.present?
  end

  def indefinite_articlerize(params_word)
    %w[a e i o u].include?(params_word[0].downcase) ? "an #{params_word}" : "a #{params_word}"
  end
end
