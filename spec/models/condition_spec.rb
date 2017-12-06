describe Condition do
  describe "Class Methods" do
    it ".rides_on_days_in_temp_range_order_desc" do
      result = Condition.rides_on_days_in_temp_range_order_desc(60, 90)

      expected = [748, 252]

      expect(result).to eq(expected)
    end

    it ".temperature_ranges" do
      result = Condition.temperature_ranges

      expected = [[47.0, 57.0], [57.0, 67.0], [67.0, 77.0], [77.0, 87.0], [87.0, 97.0]]

      expect(result).to eq(expected)
    end

    it ".rides_on_days_in_wind_speed_range_order_desc" do
      result = Condition.rides_on_days_in_wind_speed_range_order_desc(0, 90)

      expected = [748, 252]

      expect(result).to eq(expected)
    end

    it ".wind_speed_ranges" do
      result = Condition.wind_speed_ranges

      expected = [[0.0, 4.0], [4.0, 8.0], [8.0, 12.0], [12.0, 16.0], [16.0, 20.0], [20.0, 24.0]]

      expect(result).to eq(expected)
    end

    it ".rides_on_days_in_visibility_range_order_desc" do
      result = Condition.rides_on_days_in_visibility_range_order_desc(0, 90)

      expected = [748, 252]

      expect(result).to eq(expected)
    end


    it ".visibilty_ranges" do
      result = Condition.visibility_ranges

      expected = [[4.0, 8.0], [8.0, 12.0]]

      expect(result).to eq(expected)
    end

    it ".rides_on_days_in_precipitation_range_order_desc" do
      result = Condition.rides_on_days_in_precipitation_range_order_desc(0, 90)


      expect(result).to eq([748, 252])
    end

    it ".precipitation_ranges" do
      result = Condition.precipitation_ranges

      expected =  [[0.0, 0.5], [0.5, 1.0], [1.0, 1.5], [1.5, 2.0], [2.0, 2.5], [2.5, 3.0], [3.0, 3.5]]

      expect(result).to eq(expected)
    end


    it ".number_of_groups" do
      result = Condition.number_of_groups(10,0,3.3)

      expected = 4

      expect(result).to eq(expected)
    end

    it ".build_range_array" do
      result = Condition.build_range_array(10,0,3.3)

      expected = [[0.0,3.3], [3.3, 6.6], [6.6, 9.9], [9.9, 13.2]]

      expect(result).to eq(expected)
    end

    context "no rides in range" do
      it ".average" do
        result = Condition.average([])

        expected = 0

        expect(result).to eq(expected)
      end

      it ".max" do
        result = Condition.max([])

        expected = 0

        expect(result).to eq(expected)
      end

      it ".min" do
        result = Condition.max([])

        expected = 0

        expect(result).to eq(expected)
      end
    end

    context "many rides in range" do
      it ".average" do
        result = Condition.average([748, 252])

        expected = 500

        expect(result).to eq(expected)
      end

      it ".max" do
        result = Condition.max([748, 252])

        expected = 748

        expect(result).to eq(expected)
      end

      it ".min" do
        result = Condition.min([748, 252])

        expected = 252

        expect(result).to eq(expected)
      end
    end
  end
end
