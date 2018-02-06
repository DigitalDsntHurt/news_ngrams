class UrlQueuesController < ApplicationController
  before_action :set_url_queue, only: [:show, :edit, :update, :destroy]

  # GET /url_queues
  # GET /url_queues.json
  def index
    @url_queues = UrlQueue.all.order(updated_at: :desc)
  end

  # GET /url_queues/1
  # GET /url_queues/1.json
  def show
  end

  # GET /url_queues/new
  def new
    @url_queue = UrlQueue.new
  end

  # GET /url_queues/1/edit
  def edit
  end

  # POST /url_queues
  # POST /url_queues.json
  def create
    @url_queue = UrlQueue.new(url_queue_params)

    respond_to do |format|
      if @url_queue.save
        format.html { redirect_to @url_queue, notice: 'Url queue was successfully created.' }
        format.json { render :show, status: :created, location: @url_queue }
      else
        format.html { render :new }
        format.json { render json: @url_queue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /url_queues/1
  # PATCH/PUT /url_queues/1.json
  def update
    respond_to do |format|
      if @url_queue.update(url_queue_params)
        format.html { redirect_to @url_queue, notice: 'Url queue was successfully updated.' }
        format.json { render :show, status: :ok, location: @url_queue }
      else
        format.html { render :edit }
        format.json { render json: @url_queue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /url_queues/1
  # DELETE /url_queues/1.json
  def destroy
    @url_queue.destroy
    respond_to do |format|
      format.html { redirect_to url_queues_url, notice: 'Url queue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url_queue
      @url_queue = UrlQueue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_queue_params
      params.require(:url_queue).permit(:date_added_to_queue, :publication, :url, :date_scraped)
    end
end
