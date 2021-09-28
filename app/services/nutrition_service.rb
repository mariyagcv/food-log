require 'httparty'
require 'dotenv'

Dotenv.load('app/assets/config/.env')

module NutritionService
  # TODO: figure out why I need self
  def self.create(entry_params)
    if !entry_params['carbs'] && !entry_params['protein'] && !entry_params['calories']
      entry_params = NutritionService.getNutritionInfo(entry_params)
      @entry = Entry.new(entry_params)
    end
  end

  def self.getNutritionInfo(params)
    meal = params['meal']
    api_secret = Dotenv.parse('.env.local', 'app/.env')

    app_id = api_secret['APP_ID']
    app_key = api_secret['APP_KEY']

    # TODO: if a meal doesn't exist, the external API still returns status 200 so you have to check if there's any contents back
    # check that calories and totalWeight are not 0 (otherwise, the meal name is invalid)
    response = HTTParty.get("https://api.edamam.com/api/nutrition-data?app_id=#{app_id}&app_key=#{app_key}&nutrition-type=logging&ingr=#{meal}")

    if response.code == 200 && validResponse(response)
      { 'meal' => meal, 'calories' => response['calories'], 'protein' => response['totalNutrients']['PROCNT']['quantity'],
        'carbs' => response['totalNutrients']['CHOCDF']['quantity'] }

    else puts 'nope'
      # TODO: else don't create the object and throw an error (or allow user to make request with their own inputs)
    end
  end

  def self.validResponse(response)
    # only if the first two ones are free, then it will go on evaluating the next
    (!response.body.nil? && !response.body.empty?) && response['totalWeight'] != 0
  end

end
