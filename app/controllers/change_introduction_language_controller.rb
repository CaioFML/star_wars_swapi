class ChangeIntroductionLanguageController < ApplicationController
  def create
    @person = Person.includes(:species, :starships, :homeworld).find(params[:id]).decorate
    @language = params[:language]
  end
end
