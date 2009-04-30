class List
  STAR_BULLET   = :star
  CIRCLE_BULLET = :circle
  PLUS_BULLET   = :plus
  SPACE_BULLET  = :space

  BULLETS = {
    :star   => lambda{|app| app.star(-3,13,5,6,3)},
    :circle => lambda{|app| app.oval(-7,10,7)},
    :plus   => lambda do |app|
                 # rect(x,y,w,h) NOTE, docs are wrong
                 length = 9
                 beam = 1
                 app.rect(-5,8,beam,length,1)   # vertical bar
                 app.rect(-9,12,length,beam,1)  # horizontal bar
               end,
    :space  => lambda {|app| }
    }
end
