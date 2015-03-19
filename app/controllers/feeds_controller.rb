class FeedsController < ApplicationController
  def show
    @feed = Feed.includes(:episodes).find_by slug: params[:slug]
    @episodes = @feed.published_episodes

    expires_in 5.minutes, :public => true

    respond_to do |format|
      format.html
      format.xml
    end

  end

  def subcategories
    case params[:category].downcase
    when "arts"
      subcategories = ["Design", "Fashion & Beauty", "Food", "Literature", "Performing Arts", "Visual Arts"]
    when "business"
      subcategories = ["Business News", "Careers", "Investing", "Management & Marketing", "Shopping"]
    when "education"
      subcategories = ["Education", "Education Technology", "Higher Education", "K-12", "Language Courses", "Training"]
    when "games & hobbies"
      subcategories = ["Automotive", "Aviation", "Hobbies", "Other Games", "Video Games"]
    when "government & organizations"
      subcategories = ["Local", "National", "Non-Profit", "Regional"]
    when "health"
      subcategories = ["Alternative Health", "Fitness & Nutrition", "Self-Help", "Sexuality"]
    when "religion & spirituality"
      subcategories = ["Buddhism", "Christianity", "Hinduism", "Islam", "Judaism", "Other", "Spirituality"]
    when "science & medicine"
      subcategories = ["Medicine", "Natural Sciences", "Social Sciences"]
    when "society & culture"
      subcategories = ["History", "Personal Journals", "Philosophy", "Places & Travel"]
    when "sports & recreation"
      subcategories = ["Amateur", "College & High School", "Outdoor", "Professional"]
    when "technology"
      subcategories = ["Gadgets", "Tech News", "Podcasting", "Software How-To"]
    else
      subcategories = ["None"]
    end

    respond_to do |format|
      format.json { render json: subcategories }
    end
  end
end
