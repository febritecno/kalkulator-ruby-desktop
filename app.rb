Shoes.app(title: "Kalkulator Ruby", width: 400, height: 480) do
  number_field = nil
  @number = 0
  @state = 'unset'
  @op = nil
  @previous = 0
  flow width: 400, height: 480 do
    flow width: 0.75, height: 0.2 do
      background rgb(255, 140, 0)
      number_field = para @number, margin: 10
    end

    flow width: 0.25, height: 0.2 do
      button 'hapus', width: 1.0, height: 1.0 do
        @number = 0
        number_field.replace(@number)
      end
    end

    flow width: 1.0, height: 0.8 do
      background rgb(139, 206, 236)
      %w(7 8 9 + 4 5 6 - 1 2 3 / 0 . = *).each do |btn|
        button btn, width: 100, height: 100 do
          case btn
            when /[0-9]/
              @number = @number.to_i * 10 + btn.to_i
            when '='
              @number = @previous.send(@op, @number)
            else
              @previous, @number = @number, nil
              @op = btn
          end
          number_field.replace(@number)
        end
      end
    end
  end
end