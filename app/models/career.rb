class Career < ApplicationRecord
  enum :job_type, { full_time: 0, part_time: 1 }
end