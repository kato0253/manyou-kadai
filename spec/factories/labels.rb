FactoryBot.define do
  factory :label do
    name { "FactoryラベルA" }
  end
  factory :second_label, class: Label do
    name { "FactoryラベルB" }
  end
  factory :third_label, class: Label do
    name { "FactoryラベルC" }
  end
end
