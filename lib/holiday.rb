#require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  # given that holiday_hash looks like this:
  # {
  #   :winter => {
  #     :christmas => ["Lights", "Wreath"],
  #     :new_years => ["Party Hats"]
  #   },
  #   :summer => {
  #     :fourth_of_july => ["Fireworks", "BBQ"]
  #   },
  #   :fall => {
  #     :thanksgiving => ["Turkey"]
  #   },
  #   :spring => {
  #     :memorial_day => ["BBQ"]
  #   }
  # }
  # return the second element in the 4th of July array
  return holiday_hash[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(holiday_hash, supply)
  # holiday_hash is identical to the one above
  # add the second argument, which is a supply, to BOTH the
  # Christmas AND the New Year's arrays
  holiday_hash[:winter].each_key do |holiday|
    holiday_hash[:winter][holiday] << supply
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_hash[:spring][:memorial_day] << supply
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
  # code here
  # remember to return the updated hash
  supply_array.each do |i|
    if !!!holiday_hash[season][holiday_name]
      !!!holiday_hash[season][holiday_name] = []
    end
    holiday_hash[season][holiday_name] << i 
  end
end

def all_winter_holiday_supplies(holiday_hash)
  # return an array of all of the supplies that are used in the winter season
  list = []

  holiday_hash[:winter].each  do |a,b|
    list << b 
  end

  return list.flatten

end

def all_supplies_in_holidays(holiday_hash)
  # iterate through holiday_hash and print items such that your readout resembles:
  # Winter:
  #   Christmas: Lights, Wreath
  #   New Years: Party Hats
  # Summer:
  #   Fourth Of July: Fireworks, BBQ
  # etc.

  holiday_hash.each_key do |season|
    puts "#{season}:".capitalize
    holiday_hash[season].each do |holiday,array|
      string = "#{holiday}:".capitalize
      array.size.times do |i|
        string += " #{holiday_hash[season][holiday][i]}"
        if i != array.size - 1 
          string += ","
        end
      end
      words = string.gsub("_"," ").split(" ")
      words.size.times do |i| 
        if words[i] != words[i].upcase
          words[i] = words[i].capitalize
        end 
      end
      string = "  "+words.join(" ")
      puts string
    end
  end
end

def all_holidays_with_bbq(holiday_hash)
  # return an array of holiday names (as symbols) where supply lists
  # include the string "BBQ"
  output = []
  holiday_hash.each_value do |season|
    season.each_pair do |holiday,supplies|
      if supplies.include?("BBQ")
        output << holiday
      end
    end
  end
  return output
end


  holiday_hash =
   {
     :winter => {
       :christmas => ["Lights", "Wreath"],
       :new_years => ["Party Hats"]
     },
     :summer => {
       :fourth_of_july => ["Fireworks", "BBQ"]
     },
     :fall => {
       :thanksgiving => ["Turkey"]
     },
     :spring => {
       :memorial_day => ["BBQ"]
     }
   }

  all_holidays_with_bbq(holiday_hash)




