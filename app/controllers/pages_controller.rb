

class PagesController < ApplicationController

  skip_before_filter :check_logged_in, except: :show 

    def terms
    end

    def privacy
    end

    def contact
    end
end