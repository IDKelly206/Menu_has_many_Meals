module Edamam
  class Erecipe
    attr_accessor :label,
                  :source,
                  :yield




    def self.search(query = [])
      response = Request.get_json(query)
      response.fetch(:hits).map do |r|
        id_ing = "#{r[:_links][:self][:href]}".partition("v2/")
        id = id_ing[-1].partition("?").first
        Recipe.new(
                   label:     "#{r[:recipe][:label]}",
                   source:    "#{r[:recipe][:source]}",
                   yield:     "#{r[:recipe][:yield]}",
                   image:     "#{r[:recipe][:image]}",
                   erecipe_id: "#{id}"
                  )
      end
    end
  end
end
