require "will_paginate/array"

class HomeController < ApplicationController
  helper_method :category_options, :article_options

  def index; end

  def search
    # category_id
    # search
    # page

    results = total_search_results.paginate(page: params[:page], per_page: 3)

    render json: {
      results: results,
      pagination: {
        more: results.next_page.present?
      }
    }
  end

  private

  def category_options
    Category.all.pluck(:name, :id)
  end

  def article_options
    Article.all.pluck(:title, :id)
  end

  def total_search_results
    return @total_search_results if @total_search_results.present?

    articles_json = Article.where(category_id: params[:category_id])
                      .ransack(title_cont: params[:search])
                      .result
                      .map do |article|
                        {
                          id: "article_#{article.id}",
                          text: article.title,
                          created_at: article.created_at.to_i # sort
                        }
                      end
    reports_json = Report.where(category_id: params[:category_id])
                          .ransack(title_cont: params[:search])
                          .result
                          .map do |report|
                            {
                              id: "report_#{report.id}",
                              text: report.title,
                              created_at: report.created_at.to_i # sort
                            }
                          end

    @total_search_results = (articles_json + reports_json).sort { |data| data[:created_at] }
  end
end
