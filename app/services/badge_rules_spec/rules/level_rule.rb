module BadgeRulesSpec
  module Rules
    class LevelRule < BadgeRulesSpec::BadgeRules
      def success?
        level = @option
        return if @test.level != level.to_i

        Test.by_level_and_ids(level, @test_passage.passed_tests_id)  == Test.by_level(level).count
      end
    end
  end
end
