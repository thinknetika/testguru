class BadgeService
  RULES = {
    attempt: BadgeRulesSpec::Rules::AttemptRule,
    category: BadgeRulesSpec::Rules::CategoryRule,
    # level: Badges::LevelRuleSpecification
  }.freeze

  def initialize(test_passage)
    @test_passage = test_passage
  end

  def call
    badges = Badge.where(rule_name: RULES.keys.map(&:to_s))

    badges.each do |badge|
      rule = RULES[badge.rule_name.to_sym].new(@test_passage, badge.rule_value)
      @test_passage.user.badges << badge if rule.success?
     end
  end
end
