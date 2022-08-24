class UserCoreSkill < ApplicationRecord
  belongs_to :core_skill
  belongs_to :skillable, :polymorphic => true
end
