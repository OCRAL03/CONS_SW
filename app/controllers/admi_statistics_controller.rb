class AdminStatisticsController < ApplicationController
  before_action :authenticate_admin!

  def general
    @gender_distribution = Survey.group(:gender).count
    @occupation_distribution = Survey.group(:occupation).count
    @age_distribution = Survey.group("CASE 
      WHEN age BETWEEN 18 AND 25 THEN '18-25'
      WHEN age BETWEEN 26 AND 35 THEN '26-35'
      WHEN age BETWEEN 36 AND 50 THEN '36-50'
      ELSE '50+' END").count
    @sleep_comparison = Survey.group(:gender).average(:hours_of_sleep)
    @activity_comparison = Survey.group(:gender).average(:activity_minutes)
    @sleep_trends = Survey.group_by_week(:created_at).average(:hours_of_sleep)
    @activity_trends = Survey.group_by_week(:created_at).average(:activity_minutes)
  end
end
