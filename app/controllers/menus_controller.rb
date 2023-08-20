class MenusController < ApplicationController
  before_action :set_household
  before_action :set_users
  before_action :set_menu, only: [:show]
  # before_action :set_meal, only: [:index]
  before_action :set_meal_type, only: [:index, :show]


  def index
    calendar = (Time.now.to_date...(Time.now.to_date+10))
    menu_ids = Menu.where('household_id = ?', @household).where('date IN (:cal)', { cal: calendar }).ids

    if menu_ids.count >= calendar.count
      @menus = Menu.where('household_id = ?', @household).where('date IN (:cal)', { cal: calendar }).ordered
    else
      cal_menu = Menu.where('household_id = ?', @household).where('date IN (:cal)', { cal: calendar }).ordered
      menu_dates = cal_menu.map { |d| d.date }
      menu_dates_missing = calendar.select { |d| d if menu_dates.exclude?(d) }
      menu_dates_missing.each { |d| Menu.create!(date: d, household_id: @household) }
      @menus = Menu.where('household_id = ?', @household).where('date IN (:cal)', { cal: calendar }).ordered
    end

    console
  end

  def show
  end

  def new
    @menu = Menu.new
  end

  def create
  end

  private
  def set_household
    @household = current_user.household_id
  end

  def set_users
    @users = User.where(household_id: @household).all
  end

  def set_menu
    @menu = Menu.find(params[:id])
  end

  # def set_meal
  #   @meal = @menu.meals.find(params[:id])
  # end

  def set_meal_type
    @meal_type = %w(Breakfast Lunch Dinner)
  end

  def menu_params
    params.require(:menu).permit(:date)
  end
end
