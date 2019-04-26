# require 'pry'

def second_supply_for_fourth_of_july(holiday_hash)
  holiday_supplies[:summer][:fourth_of_july][1]
end

def add_supply_to_winter_holidays(season, supply)  
  holiday_supplies[:winter].each do |holiday, supplies|
    holiday_supplies[:winter][holiday] << supply 
  end
end


def add_supply_to_memorial_day(holiday_hash, supply)
  # again, holiday_hash is the same as the ones above
  # add the second argument to the memorial day array
  holiday_supplies[:spring][:memorial_day] << supply # can do this directly here.
end

def add_new_holiday_with_supplies(holiday_hash, season, holiday_name, supply_array)
      holiday_supplies[season][holiday_name] = supply_array
  holiday_supplies
end

def all_winter_holiday_supplies(holiday_hash)
  array = []
  holiday_hash[:winter].each do |holiday_hash, supplies| # we already know about winter from the question, so we simply iterate and output the supplies from the keys.
    array.push(supplies) # outputs [["Lights", "Wreath"], ["Party Hats"]]
  end
  array.flatten
end

def all_supplies_in_holidays(holiday_hash)
  season_array = []
  supplies_array = []
  holiday_array = []
  holiday_supplies.each_key do |k|
    puts "#{k.capitalize}:"
    holiday_supplies[k].each do |key, value|
      puts  "  #{key.to_s.split("_").collect(&:capitalize).join(" ")}: #{value.join(", ")}"
      # The above will be incredibly useful moving forward. Look below for explanation...
    end
  end
end


# puts  "  #{key.to_s.split("_").collect(&:capitalize).join(" ")}: #{value.join(", ")}"
# This line takes a key value from an existing hash, which happens to be the following five values:
#      :christmas  :new_years   :second_supply_for_fourth_of_july :fall   :winter
# Now, as you can see we need to do several things to these values to match the required format. We need to remove the symbol type and create a string, remove the _ and capitalise the values and add a : at the end.  
# To do this, we use the above expression, which does the following:
# key.to_s – this turns the symbol into a string inside an array => ["new_years"]
# .split("_") – this splits the keys with multiple words and removes the _ => ["new, year"]
# .collect(&:capitalize) – this does effectively a each loop inside the initial array value and ensures that all words are capitalised => ["New, Years"]
# .join(" ") – creates a string (removes the array) and preserves a space between the contained string values "New Years"
# With the final : we have our formatting!!!

def all_holidays_with_bbq(holiday_hash)
array = holiday_supplies.collect do |key, value| # .collect is better than each because it returns an array.
  holiday_supplies[key].collect do |k, v| # first bit equal to value
    if v.include?("BBQ")
      k
    end
  end
end
array.flatten.compact
# array was defined at the beginning of the expression. .flatten will remove the first, external array. .compact will remove the nil values!!!
end