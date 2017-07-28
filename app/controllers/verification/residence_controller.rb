class Verification::ResidenceController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_verified!
  before_action :verify_lock, only: [:new, :create]
  skip_authorization_check

  def new
    abre_log
    @residence = Verification::Residence.new
  end

  def create
    abre_log
    @residence = Verification::Residence.new(residence_params.merge(user: current_user))
    p residence_params
    p current_user.address
    if @residence.save
      redirect_to proposals_path, notice: t('verification.residence.create.flash.success')
    else
      # @residence.errors.add(:document_number, 'rut sin verificar')
      abre_log p @residence.errors.messages
      render :new
      # redirect_to new_residence_path, notice: 'rut not valid'
    end
  end

  private

    def residence_params
      params.require(:residence).permit(:document_number, :document_type, :date_of_birth, :postal_code, :terms_of_service, :address)
    end
end
