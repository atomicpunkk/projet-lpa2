class Town < ActiveRecord::Base 
 validates :name, :postal_code, :lat, :long, presence: true
 before_validation :location
  
  public
  def weather
    forecast = ForecastIO.forecast(self.lat,self.long, params: { units:'si', lang: 'fr' })
    return forecast.currently
  end

  private
  def location
    city = Nominatim.search(self.name).limit(1).first
    if city
      self.lat = city.lat
      self.long = city.lon
    end
  end
end
