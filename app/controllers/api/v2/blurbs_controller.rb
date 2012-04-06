class Api::V2::BlurbsController < Api::V2::BaseController
  def show
    if stale? :etag => current_project.etag
      render :json => current_project.blurbs.find_by_key(params[:id]).to_hash, :callback => params[:callback]
    end
  end
end
