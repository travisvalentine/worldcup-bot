class InfoController < ApplicationController
  def home
    image_src = "http://usatthebiglead.files.wordpress.com/2014/06/vicente-del-bosque-facepalm-during-chile.gif?w=1000"
    render text: "<h2 style='font-family: Helvetica Neue;'>We'll get something better here soon. Until then, check out the <a href='https://github.com/travisvalentine/worldcup-bot/blob/master/README.md'>README</a> for available endpoints.</h2>\n\n\n<img src='#{image_src}' style='width:100%;' />"
  end
end