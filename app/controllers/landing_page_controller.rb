class LandingPageController < ApplicationController
    layout 'landingpage'
    before_action :get_user,  only: [:perfil, :update, :match_lawyer]
    before_action :get_lawyers,  only: [:match_lawyer]

    def index
    end
    def perfil
    end

    def update
        puts('entrei')
        puts(@user)
        if @user.update_attributes(user_avatar_param)
            redirect_to perfil_path 
        else
            print('erro')
            render json: @user.errors 
        end
    end
    def match_lawyer
        if(@user.lawyer_id == nil)
            if(Lawyer.where(state: @user.state).count >= 1)
                lawyer_by_state = Lawyer.where(state: @user.state)
                @user.lawyer_id = lawyer_by_state.sample.id
                @user.save  
                redirect_to perfil_path
            else
                redirect_to perfil_path
                flash[:error] = 'No momento não há advogados do seu estado. Em breve, tente novamente!'
            end
        else
            redirect_to perfil_path
        end
    end
    def user_avatar_param
        params.require(:user).permit(:avatar)
    end
end
