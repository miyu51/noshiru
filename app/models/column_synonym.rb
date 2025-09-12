class ColumnSynonym < ApplicationRecord
  belongs_to :column
  belongs_to :synonym
end
