module StarWars
  class ImportPeopleImages < ApplicationService
    def call
      api.get_people.data.each do |result|
        Person.where(name: result.name).update(image_url: result.image)
      end
    end

    private

    def api
      @api ||= StarWarsAPI::Characters::Request.new
    end
  end
end
