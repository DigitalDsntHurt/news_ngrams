class NgramsController < ApplicationController
  before_action :set_ngram, only: [:show, :edit, :update, :destroy]

  # GET /ngrams
  # GET /ngrams.json
  def index
    @ngrams = Ngram.all
  end

  # GET /ngrams/1
  # GET /ngrams/1.json
  def show
  end

  # GET /ngrams/new
  def new
    @ngram = Ngram.new
  end

  # GET /ngrams/1/edit
  def edit
  end

  # POST /ngrams
  # POST /ngrams.json
  def create
    @ngram = Ngram.new(ngram_params)

    respond_to do |format|
      if @ngram.save
        format.html { redirect_to @ngram, notice: 'Ngram was successfully created.' }
        format.json { render :show, status: :created, location: @ngram }
      else
        format.html { render :new }
        format.json { render json: @ngram.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ngrams/1
  # PATCH/PUT /ngrams/1.json
  def update
    respond_to do |format|
      if @ngram.update(ngram_params)
        format.html { redirect_to @ngram, notice: 'Ngram was successfully updated.' }
        format.json { render :show, status: :ok, location: @ngram }
      else
        format.html { render :edit }
        format.json { render json: @ngram.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ngrams/1
  # DELETE /ngrams/1.json
  def destroy
    @ngram.destroy
    respond_to do |format|
      format.html { redirect_to ngrams_url, notice: 'Ngram was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ngram
      @ngram = Ngram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ngram_params
      params.require(:ngram).permit(:date, :n, :terms, :occurrences)
    end
end
