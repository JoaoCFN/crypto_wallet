module ApplicationHelper
    def date_from_brazil(date_us)
        date_br = date_us.strftime("%d/%m/%Y")

        return date_br
    end

    def rails_env()
        rails_env = Rails.env

        if(rails_env.development?)
            return "Desenvovimento"
        elsif(rails_env.production?)
            return "Produção"
        else
            return "Teste"
        end
    end
end
