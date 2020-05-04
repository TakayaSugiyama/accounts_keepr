# frozen_string_literal: true

InitialAvatar.configure do |config|
  config.colors = %w[
    #1abc9c #16a085 #f1c40f #f39c12 #2ecc71 #27ae60 #e67e22 #d35400 #3498db
    #2980b9 #e74c3c #c0392b #9b59b6 #8e44ad #bdc3c7 #34495e #2c3e50 #95a5a6
    #7f8c8d #ec87bf #d870ad #f69785 #9ba37e #b49255 #b49255 #a94136
  ]
  config.text_color = '#ffffff'
  config.size = 100
  config.font_weight = 400
  config.font_family = 'HelveticaNeue-Light,Helvetica Neue Light,Helvetica Neue,Helvetica, Arial,Lucida Grande, sans-serif'
  config.seed = 0
end
