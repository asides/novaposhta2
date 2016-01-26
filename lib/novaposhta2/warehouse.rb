module Novaposhta2
  # Represents a warehouse.
  class Warehouse < Base
    attr_reader :description, :description_ru, :ref, :number, :longitude, :latitude #:nodoc:

# "Description": "Відділення No1: вул. Кутузова, 125",
# "DescriptionRu": "Отделение No1: ул. Кутузова, 125",
# "Number": "1",
# "Longitude": "30.831604000000000",
# "Latitude": "50.517213000000000",

# "Phone": "(044) 323-02-22",
# "TypeOfWarehouse": "9a68df70-0267-42a8-bb5c-37f427e36ee4",
# "Ref": "1ec09d39-e1c2-11e3-8c4a-0050568002cf",
# "CityRef": "db5c88d7-391c-11dd-90d9-001a92567626",
# "MaxWeightAllowed": null,

# "Reception": {
# "Monday": "10:00-20:00",
# "Tuesday": "10:00-20:00",
# "Wednesday": "10:00-20:00",
# "Thursday": "10:00-20:00",
# "Friday": "10:00-20:00",
# "Saturday": "10:00-17:00",
# "Sunday": null
# },

# "Delivery": {
# "Monday": "09:00-17:00",
# "Tuesday": "09:00-17:00",
# "Wednesday": "09:00-17:00",
# "Thursday": "09:00-17:00",
# "Friday": "09:00-17:00",
# "Saturday": "09:00-17:00",
# "Sunday": null
# },

# "Schedule": {
# "Monday": "09:00-20:00",
# "Tuesday": "09:00-20:00",
# "Wednesday": "09:00-20:00",
# "Thursday": "09:00-20:00",
# "Friday": "09:00-20:00",
# "Saturday": "09:00-17:00",
# "Sunday": null


    def initialize(params) #:nodoc:
      @description = params['Description']
      @description_ru = params['DescriptionRu']
      @ref = params['Ref']
      @number = params['Number'].to_i
      @longitude = params['Longitude']
      @latitude = params['Latitude']
    end
  end
end
