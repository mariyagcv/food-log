require "test_helper"

class EntryTest < ActiveSupport::TestCase

  test "should save food log when all fields are legal" do 
    entry = Entry.new(meal: "TestMeal", calories: 1, protein: 1, carbs: 1)
    assert entry.save
  end 

  test "should not save food log without meal name" do
    entry = Entry.new(carbs: 1, protein: 1)
    assert_not entry.save
  end

  test "should not save food log without carbs" do
    entry = Entry.new(meal: "TestMeal", calories:1, protein: 1)
    assert_not entry.save
  end

  test "should not save food log without protein" do
    entry = Entry.new(meal: "TestMeal", calories:1, carbs: 1)
    assert_not entry.save
  end

  test "should not save food log with negative carbs" do
    entry = Entry.new(meal: "TestMeal", calories:1, protein: 1, carbs: -1)
    assert_not entry.save
  end

  test "should not save food log with negative protein" do
    entry = Entry.new(meal: "TestMeal", calories:1, protein: -1, carbs: 1)
    assert_not entry.save
  end

  test "should not save food log with non-integer protein" do
    entry = Entry.new(meal: "TestMeal", calories:1, protein: 1.1, carbs: 1)
    assert_not entry.save
  end

  test "should not save food log with non-integer carbs" do
    entry = Entry.new(meal: "TestMeal", calories:1, protein: 1, carbs: 1.1)
    assert_not entry.save
  end

  test "should not save food log with non-integer calories" do
    entry = Entry.new(meal: "TestMeal", calories:1.1, protein: 1, carbs: 1)
    assert_not entry.save
  end

end
