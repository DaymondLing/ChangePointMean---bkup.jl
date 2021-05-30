module ChangePointMean

using Random
using Statistics

export mcppv                # p-value of existence of change point
export mcptime              # index of change point (new segment)
export mcptimechk
export mcpoint              # Single change point in Mean
export mcplast              # Most recent change point (rightmost)
export mcpall               # All change point

include("meancpd.jl")

end
