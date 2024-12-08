module BadgeRulesSpec
  module Rules
    class CategoryRule < BadgeRulesSpec::BadgeRules
      def success?
        category_id = @test.category_id

        Test.by_ids(@test_passage.passed_tests_id).by_category(category_id).count == Test.by_category(category).count
      end
    end
  end
end
