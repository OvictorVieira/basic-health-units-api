class Api::V1::InstitutesController < ApplicationController

  DEFAULT_ITEMS_PER_PAGE = 10
  INITIAL_PAGE = 1

  before_action :set_page, :set_items_per_page
  before_action :valid_query_params, only: [:find_ubs]

  def find_ubs
    all_ubs = Institute.all

    @nearby_institutes = all_ubs.ubs_within_ten_km_ordered_by_distance(latitude_param, longitude_param)

    total_ubs = all_ubs.count

    serialized_institutes = InstitutesSerializer.serialize(paginate_institutes, @page, @per_page, total_ubs)

    render json: serialized_institutes, status: :ok
  end

  private

  def latitude_param
    params['query'].split(',').first
  end

  def longitude_param
    params['query'].split(',').last
  end

  def paginate_institutes
    @institutes = @nearby_institutes
                    .page(@page)
                    .per(@per_page)
  end

  def set_page
    @page = params['page'] || INITIAL_PAGE
  end

  def set_items_per_page
    @per_page = params['per_page'] || DEFAULT_ITEMS_PER_PAGE
  end

  def valid_query_params
    return if params['query'].present?

    render json: { message: I18n.t('institutes.errors.messages.query_parameter_not_informed') },
           status: :unprocessable_entity
  end
end