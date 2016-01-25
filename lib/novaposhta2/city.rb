module Novaposhta2
  # Represents a known city.
  class City < Base
    attr_reader :description,
                :description_ru,
                :ref,
                :delivery1,
                :delivery2,
                :delivery3,
                :delivery4,
                :delivery5,
                :delivery6,
                :delivery7,
                :area,
                :area_region_description,
                :area_region_description_ru,
                :settlement_type_description,
                :settlement_type_description_ru,
                :conglomerates # :nodoc:

    def initialize(params)
      @description = params['Description']
      @description_ru = params['DescriptionRu']
      @ref = params['Ref']
      @delivery1 = params['Delivery1'].to_i
      @delivery2 = params['Delivery2'].to_i
      @delivery3 = params['Delivery3'].to_i
      @delivery4 = params['Delivery4'].to_i
      @delivery5 = params['Delivery5'].to_i
      @delivery6 = params['Delivery6'].to_i
      @delivery7 = params['Delivery7'].to_i
      @area = params['Area']
      @area_region_description = params['AreaRegionDescription']
      @area_region_description_ru = params['AreaRegionDescriptionRu']

      @settlement_type_description = params['SettlementTypeDescription']
      @settlement_type_description_ru = params['AreaRegionDescriptionRu']

      @conglomerates = params['conglomerates']
    end

    # Lists all warehouses or returns warehouse by number.
    def warehouses(number = nil)
      @warehouses ||= post('Address', 'getWarehouses', CityRef: @ref)['data'].map do |data|
        Warehouse.new(data)
      end

      if number.nil?
        @warehouses
      else
        @warehouses.find {|w| w.number == number}
      end
    end

    alias [] warehouses

    # Creates new person that belongs to the city.
    def person(firstname, lastname, phone)
      Person.new(self, firstname, lastname, phone)
    end

    class << self

      # Returns city matching +ref+.
      def find_by_ref(ref)
        query(Ref: ref).first
      end

      # Returns all cities matching a pattern.
      def match(name)
        query(FindByString: name)
      end

      # Returns a city by name or part of the name.
      # If more than one city match a +name+ - returns nil.
      def find(name)
        m = match(name)
        m.count == 1 ? m[0] : nil
      end

      alias [] find

      # Returns list of all known cities.
      def all
        match(nil)
      end

    end

    private
    def self.query(params)
      post('Address', 'getCities', params)['data'].map do |data|
        City.new(data)
      end
    end
  end
end
