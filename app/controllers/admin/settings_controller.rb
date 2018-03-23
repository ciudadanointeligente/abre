class Admin::SettingsController < Admin::BaseController

  def index
    all_settings = (Setting.all).group_by { |s| s.type  }
    @settings = all_settings['common']
    @banner_styles = all_settings['banner-style']
    @banner_imgs = all_settings['banner-img']
    @home = all_settings['home']
  end

  def texts
    all_settings = (Setting.all).group_by { |s| s.type  }
    @home = all_settings['home']
  end

  def features
    all_settings = (Setting.all).group_by { |s| s.type  }
    @feature_flags = all_settings['feature']
  end

  def update
    session[:return_to] ||= request.referer
    @setting = Setting.find(params[:id])
    @setting.update(settings_params)
    redirect_to session.delete(:return_to), notice: t("admin.settings.flash.updated")
  end

  private

    def settings_params
      params.require(:setting).permit(:value)
    end

end
