module ChangePointMean

using Random
using Statistics

export mcpoint              # Single change point in Mean
export mcplast              # Most recent change point (rightmost)
export mcpall               # All change point

include("meancpd.jl")

end
