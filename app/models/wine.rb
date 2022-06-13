class Wine < ApplicationRecord
  after_create_commit { broadcast_append_to "wines" }
  after_update_commit { broadcast_replace_to "wines" }
  after_destroy_commit { broadcast_remove_to "wines" }

  validates :name, presence: true
end