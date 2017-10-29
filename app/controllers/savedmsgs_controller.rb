class SavedmsgsController < ApplicationController
  before_action :set_savedmsg, only: [:show, :edit, :update, :destroy]

  # GET /savedmsgs
  # GET /savedmsgs.json
  def index
    @savedmsgs = Savedmsg.all
  end

  # GET /savedmsgs/1
  # GET /savedmsgs/1.json
  def show
  end

  # GET /savedmsgs/new
  def new
    @savedmsg = Savedmsg.new
  end

  # GET /savedmsgs/1/edit
  def edit
  end

  # POST /savedmsgs
  # POST /savedmsgs.json
  def create
    @savedmsg = Savedmsg.new(savedmsg_params)

    respond_to do |format|
      if @savedmsg.save
        format.html { redirect_to @savedmsg, notice: 'Savedmsg was successfully created.' }
        format.json { render :show, status: :created, location: @savedmsg }
      else
        format.html { render :new }
        format.json { render json: @savedmsg.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /savedmsgs/1
  # PATCH/PUT /savedmsgs/1.json
  def update
    respond_to do |format|
      if @savedmsg.update(savedmsg_params)
        format.html { redirect_to @savedmsg, notice: 'Savedmsg was successfully updated.' }
        format.json { render :show, status: :ok, location: @savedmsg }
      else
        format.html { render :edit }
        format.json { render json: @savedmsg.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /savedmsgs/1
  # DELETE /savedmsgs/1.json
  def destroy
    @savedmsg.destroy
    respond_to do |format|
      format.html { redirect_to savedmsgs_url, notice: 'Savedmsg was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_savedmsg
      @savedmsg = Savedmsg.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def savedmsg_params
      params.require(:savedmsg).permit(:text)
    end
end
