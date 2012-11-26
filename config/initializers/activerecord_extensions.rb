module BusPlusActiveRecordExtensions
  
  def near(latitude,longitude,range=0.1)
    where('latitude > ?',latitude-range).
    where('latitude <= ?',latitude+range).
    where('longitude > ?',longitude-range).
    where('longitude <= ?',longitude+range)
  end

end

ActiveRecord::Base.extend BusPlusActiveRecordExtensions
