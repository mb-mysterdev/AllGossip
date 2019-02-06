class PagesController < ApplicationController

    def welcome
        @name =  params[:name]
    end

    def home

    end

end
