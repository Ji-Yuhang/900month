#!/usr/bin/env ruby
require 'Qt'
require 'awesome_print'
require 'pp'

class Life < Qt::Widget
    attr_accessor :age, :month
    def initialize(parent = nil)
        super(parent)
        setWindowTitle(tr("Life"))
        resize 600,900
        @age = 0
        @month = 0
    end

    def paintEvent(e)
        painter = Qt::Painter.new(self)
        painter.renderHint = Qt::Painter::Antialiasing
        gap = height() / 75.0
        (0...75).each do |i|
            painter.drawLine(0, i * gap,width(), i * gap)
            if i != 0
                painter.drawText(0, i * gap + gap,i.to_s + "岁")
            end
        end
        wgap = width() / 13.0
        (0...13).each do |i|
            painter.drawLine( i * wgap ,0 , i * wgap,height())
        end

        x = @age / 12
        y = @age % 12
        #ap x
        #ap y

        redColor = Qt::Color.new(255,0,0)
        painter.brush = Qt::Brush.new(redColor)
        (0...@age + 1).each do |i|
            #ap "i = #{i}"
            if i == 0
                temp = 1
                while temp < 13
                    painter.drawText(wgap * temp, gap, temp.to_s + "月")
                    temp += 1
                end
            end
            if i != @age + 0
                temp  = 0
                while temp < width() and i != 0
                    if temp == 0
                        painter.drawText(0, i * gap + gap,i.to_s + "岁")
                        temp += wgap
                    else
                        painter.drawRect(temp + 1,i*gap + 1,wgap - 2, gap -2 )
                        temp += wgap
                    end
                end
            else
                j = 0
                temp = 0
                while j < @month + 1
                    if temp == 0
                        painter.drawText(0, i * gap + gap,i.to_s + "岁")
                    else
                        painter.drawRect(temp + 1, i*gap + 1, wgap -2 ,gap - 2)
                    end
                    temp += wgap
                    j += 1
                end
            end
            
        end
        
 
    end
end


