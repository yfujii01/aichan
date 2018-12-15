# frozen_string_literal: true

class TalkTablesController < ApplicationController
  before_action :set_talk_table, only: %i[show edit update destroy]
  PER = 10

  # GET /talk_tables
  # GET /talk_tables.json
  def index
    # @talk_tables = TalkTable.all
    # @talk_tables = TalkTable.page(params[:page]).per(PER)
    @talk_tables = TalkTable.order(params[:sort]).page(params[:page]).per(PER)

    # inputで部分一致検索
    @talk_tables = @talk_tables.get_by_input params[:input] if params[:input].present?

    # messageで部分一致検索
    @talk_tables = @talk_tables.get_by_message params[:message] if params[:message].present?

    # tagで部分一致検索
    @talk_tables = @talk_tables.get_by_tag params[:tag] if params[:tag].present?
  end

  # GET /talk_tables/1
  # GET /talk_tables/1.json
  def show; end

  # GET /talk_tables/new
  def new
    @talk_table = TalkTable.new
  end

  # GET /talk_tables/1/edit
  def edit; end

  # POST /talk_tables
  # POST /talk_tables.json
  def create
    @talk_table = TalkTable.new(talk_table_params)

    respond_to do |format|
      if @talk_table.save
        format.html { redirect_to @talk_table, notice: 'Talk table was successfully created.' }
        format.json { render :show, status: :created, location: @talk_table }
      else
        format.html { render :new }
        format.json { render json: @talk_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /talk_tables/1
  # PATCH/PUT /talk_tables/1.json
  def update
    respond_to do |format|
      if @talk_table.update(talk_table_params)
        format.html { redirect_to @talk_table, notice: 'Talk table was successfully updated.' }
        format.json { render :show, status: :ok, location: @talk_table }
      else
        format.html { render :edit }
        format.json { render json: @talk_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /talk_tables/1
  # DELETE /talk_tables/1.json
  def destroy
    @talk_table.destroy
    respond_to do |format|
      format.html { redirect_to talk_tables_url, notice: 'Talk table was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def talk_table_search_reset
    puts 'talk_table_search_reset!!!!!!!!!!!'
    redirect_to talk_tables_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_talk_table
    @talk_table = TalkTable.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def talk_table_params
    params.require(:talk_table).permit(:input, :message, :tag)
  end
end
