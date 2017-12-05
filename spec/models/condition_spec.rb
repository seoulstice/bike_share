describe Condition do
  describe "Class Methods" do
    it ".temperature_ranges" do
      result = Condition.temperature_ranges

      expected = [[37.0, 47.0], [47.0, 57.0], [57.0, 67.0], [67.0, 77.0], [77.0, 87.0], [87.0, 97.0], [97.0, 107.0]]

      expect(result).to eq(expected)
    end

    it ".rides_on_days_in_temp_range_order_desc" do
      result = Condition.rides_on_days_in_temp_range_order_desc(60, 90)

      expected = [748, 252]

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
