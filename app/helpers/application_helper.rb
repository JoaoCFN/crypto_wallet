module ApplicationHelper
    def date_from_brazil(date_us)
        date_br = date_us.strftime("%d/%m/%Y")

        return date_br
    end
end
