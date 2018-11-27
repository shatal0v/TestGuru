class User < ApplicationRecord
  def completed_tests(level)
    Test.joins('JOIN passed_tests ON tests.id = passed_tests.test_id')
    .where('passed_tests.user_id = ? AND tests.level = ?', self.id, level)
  end
end
