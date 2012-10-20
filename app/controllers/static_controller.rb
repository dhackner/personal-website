class StaticController < ApplicationController
  def show_hacknermemonicse2008
    send_file "#{Rails.root}/public/assets/HacknerMemonICSE2008.pdf", :disposition => 'inline', :type => 'application/pdf'
  end
end
