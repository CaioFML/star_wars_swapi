class PeopleController < ApplicationController
  def index
    @people = Person.all.order(id: :asc).page(params[:page]).per(8)
  end

  def show
    @person = Person.find(params[:id])
  end
end
