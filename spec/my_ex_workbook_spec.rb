require_relative '../lib/my_ex_workbook'
describe MyExWorkbook do
  attr_accessor :wb
  before do
    @wb = MyExWorkbook.new('./asset/名前付きセルの定義.xlsx')
  end

  it "can list some named_range " do
    p @wb.named_ranges
    expect(@wb.named_ranges.length).to be(3)
  end

end
