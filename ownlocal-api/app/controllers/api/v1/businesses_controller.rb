require 'json'

class Api::V1::BusinessesController < ApplicationController
  #Returns all businesses by page requested
  def index
    
    pagination_data = Pagination.new(params[:page], params[:items_per])
    
    #Get busniesses by page and sorted by id
    businesses = Business.limit(pagination_data.items_per_page).offset(pagination_data.first_item).order(_id: :asc)
    
    if (pagination_data.page_number == 0)
      result = ErrorMessage.new(:bad_request, "Page number must be greater than zero.")
      status = :bad_request
    elsif (businesses.count(:_id) == 0)
      result = ErrorMessage.new(:bad_request, "Your criteria rendered no results.")
      status = :bad_request
    else
      #Format response object
      result = format_businesses_response(businesses.to_json, pagination_data)
      status = :ok
    end
    
    render json: result, :status => status
  end

  #Returns business by id 
  def show
    business_id = params[:_id]
    result = Business.find(business_id) rescue nil
    
    if (result == nil)
      result = ErrorMessage.new(:bad_request, "Id #{business_id} doesn't exist.")
      status = :bad_request
    else
      status = :ok
    end
    
    render json: result, :status => status
  end
  
  #Formats a page of businesses with pagination information
  def format_businesses_response(json_data, pagination_data)
    data_hash = JSON.parse(json_data) 
    new_hash = { "businesses" => data_hash, "pagination" => pagination_data }
    new_hash.to_json
  end
end
