# frozen_string_literal: true

class CertificatesController < ApplicationController
  before_action :set_certificate, only: %i[show edit update destroy]

  # GET /certificates or /certificates.json
  def index
    @course = Certificate.all.map do |certificate|
      { course_id: certificate.course_id, user_id: certificate.user_id } if certificate.user_id == current_user.id
    end.compact
    @certificates = Certificate.where(user_id: current_user.id)
  end

  # GET /certificates/1 or /certificates/1.json
  def show; end

  def generate_certificate
    @certificate = Certificate.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: 'certificate', template: 'certificates/generate_certificate'
      end
    end
  end

  # GET /certificates/new
  def new
    @certificate = Certificate.new
  end

  # GET /certificates/1/edit
  def edit; end

  # POST /certificates or /certificates.json
  def create
    @certificate = Certificate.new(certificate_params)

    respond_to do |format|
      if @certificate.save
        format.html { redirect_to certificate_url(@certificate), notice: 'Certificate was successfully created.' }
        format.json { render :show, status: :created, location: @certificate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /certificates/1 or /certificates/1.json
  def update
    respond_to do |format|
      if @certificate.update(certificate_params)
        format.html { redirect_to certificate_url(@certificate), notice: 'Certificate was successfully updated.' }
        format.json { render :show, status: :ok, location: @certificate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @certificate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /certificates/1 or /certificates/1.json
  def destroy
    @certificate.destroy

    respond_to do |format|
      format.html { redirect_to certificates_url, notice: 'Certificate was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_certificate
    @certificate = Certificate.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def certificate_params
    params.require(:certificate).permit(:grade, :user_id, :course_id)
  end
end
