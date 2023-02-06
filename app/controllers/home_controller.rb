class HomeController < ApplicationController
  helper_method :category_options, :article_options

  def index; end

  private

  def category_options
    Category.all.pluck(:name, :id)
  end

  def article_options
    Article.all.pluck(:title, :id)
  end
end
