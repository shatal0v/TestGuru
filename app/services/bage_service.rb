# frozen_string_literal: true

class BageService
  def initialize(test_passage)
    @test_passage = test_passage
  end

  def achived_bages
    bages = Bage.all
    
    bages.each do |bage|
      if self.send(bage.rule.to_sym)
        @test_passage.user.bages.push(bage)
      end
    end
  end

  private

  def first_test_bage
    @first_test_bage ||= first_test?
  end

  def all_right_bage
    @test_passage.percent == 100
  end

  def backend_bage
    category_bage('backend')
  end

  def embedded_bage
    category_bage('embedded')
  end

  def level_1_bage
    completed = @test_passage.user.tests.where(level: 1).order(id: :asc)
    all_tests_with_level = Test.where(level: 1).order(id: :asc)

    completed == all_tests_with_level
  end

  def category_bage(category)
    completed = @test_passage.user.tests.by_category(category).pluck(:title).uniq.sort
    all_tests_with_category =  Test.by_category(category).pluck(:title).sort

    completed == all_tests_with_category
  end

  def first_test?
    @test_passage.user.tests.count >= 1
  end
end
