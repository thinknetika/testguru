module BadgeRulesSpec
  module Rules
    class AttemptRule < BadgeRulesSpec::BadgeRules
      def success?
        attempt = @option

        return unless @test_passage.passed?

        TestPassage.where(user: @user, test: @test).count <= attempt.to_i
      end
    end
  end
end
