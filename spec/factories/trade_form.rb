FactoryBot.define do
  factory :trade_form do
    postcode {"888-7777"}
    prefecture {2}
    city {"仙台市"}
    address_line_1 {"あそこ"}
    address_line_2 {"お家"}
    phone {"0229998888"}
    token {"testsample"}
  end
end
