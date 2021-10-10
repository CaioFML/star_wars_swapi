module StarWars
  class ImportPeopleImages < ApplicationService
    def call
      api.get_people.data.each do |result|
        update_person_image(result)
      end
    end

    private

    def api
      @api ||= StarWarsAPI::Characters::Request.new
    end

    def update_person_image(result)
      Person.where(name: result.name).update(image_url: result.image)
    end
  end
end
