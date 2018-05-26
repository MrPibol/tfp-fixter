class Duck < ApplicationRecord
    include RankedModel
    ranks :row_order
end
